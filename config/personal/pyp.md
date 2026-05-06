## TL;DR

https://github.com/hauntsaninja/pyp

`pyp` loops through lines from stdio

Cheatsheet:
- Use `x`, `l` or `line` for a line in the input. 
- Use `i`, `idx` or `index` for the index
- Use `lines` to get a list of rstripped lines
- Use `stdin` to get sys.stdin
- Use `-b`, `--before` to run CODE before processing loop
- Use `-a`, `--after` to run CODE after processing loop
- Use print explicitly if pyp's implicit printing is insufficient
- If the magic is ever too mysterious, use `--explain`

### Implicit Printing
  - Like a REPL, results of code are automically printed

```bash
$ echo test | pyp 'len(x)'
4
```


## Installation

Run `pip install pypyp` <sup>(note the extra "yp"!)</sup>

You can also install pyp in other ways:
- `uv tool install pypyp`
- `brew install pyp` via [Homebrew](https://formulae.brew.sh/formula/pyp)

pyp requires Python 3.8 or above.

## How it works

pyp will statically analyse the input code to detect undefined variables. Based on what it finds,
it will proceed to transform the AST of the input code as needed. We then compile and execute the
result, or if using `--explain`, unparse the AST back to source code.

## Examples

This section will walk you through the details of using pyp, and hopefully replace your needs
for many common shell utilities. For a cheatsheet / tldr, run `pyp --help`.

#### pyp can easily be used to apply Python code to each line in the input.
Just use one of the magic variables `x`, `l` or `line` to refer to the current line.

```sh
# pyp like cut
ls | pyp 'x[:3]'
ps x | pyp 'line.split()[4]'
```

#### pyp can be used to easily apply Python code to the entire input as well.
Use the magic variable `lines` for a list of rstripped lines or `stdin` for `sys.stdin`.

```sh
# pyp like wc -c
cat /usr/share/dict/words | pyp 'len(stdin.read())'

# pyp like awk
seq 1 5 | pyp 'sum(map(int, lines))'
```

#### pyp will automatically import modules you use.

```sh
# pyp like sh
echo echo echo | pyp 'subprocess.run(lines[0], shell=True); pass'

# pyp like jq
curl -s 'https://api.github.com/repos/hauntsaninja/pyp/commits?per_page=1' | pyp 'json.load(stdin)[0]["commit"]["author"]'

# pyp like egrep
cat /usr/share/dict/words | pyp 'x if re.search("(p|m)yth", x) else None'
```

For `collections`, `math`, `itertools`, `pathlib.Path`, `pprint.pp`, pyp will figure it out even
if you don't use the qualified name.
```sh
# pyp like bc
pyp 'sqrt(5)'

# pyp like ${x##*.}
ls | pyp 'Path(x).suffix'
```

#### pyp can give you access to loop indices using the magic variables `i`, `idx` or `index`.

```sh
# pyp like line numbers
cat setup.py | pyp 'f"{idx+1: >3} {x}"'
```

#### Note so far you haven't had to call `print`!
By default, pyp will print the last expression in your code — except if it evaluates to `None`
(or the last statement is `pass`).
And you can always explicitly call `print` yourself, in which case pyp will stay out of your way.

```sh
# pyp like grep
cat /usr/share/dict/words | pyp 'x if "python" in x else None'
cat /usr/share/dict/words | pyp 'if "python" in x: print(x); "this will not be printed"'
```

#### pyp will attempt to intelligently print dicts and iterables.
This makes the output of pyp easier to compose with shell tools.
Again, explicit printing will stop this magic, but pyp makes the function `pypprint` available if
you do want to explicitly opt back in.

```sh
# pyp like tail
ls | pyp 'lines[-10:]'

# pyp like sort
ls | pyp 'sorted(lines)'
ls | pyp 'print(f"Sorting {len(lines)} lines"); pypprint(sorted(lines))'

# pyp like sort | uniq
ls | pyp 'sorted(set(lines))'
```

#### pyp lets you run snippets of Python before and after processing input.
Note if you run into trouble with semicolons and want a new line (without using a multiline string
in your shell), you can just pass another string to pyp. You can also always pipe pyp to pyp!

```sh
# pyp like anything!
ps aux | pyp -b 'd = defaultdict(list)' 'user, pid, *_ = x.split()' 'd[user].append(pid)' -a 'del d["root"]' -a 'd'
```

#### pyp can be magical, but it doesn't have to be mysterious!
Use `--explain` or `--script` and pyp will output a script equivalent to what it would run. This can also serve as a
useful starting point for more complex scripts.
```sh
pyp --explain -b 'd = defaultdict(list)' 'user, pid, *_ = x.split()' 'd[user].append(pid)' -a 'del d["root"]' -a 'd'
```

```py
#!/usr/bin/env python3
from collections import defaultdict
from pyp import pypprint
import sys
d = defaultdict(list)
for x in sys.stdin:
    x = x.rstrip('\n')
    (user, pid, *_) = x.split()
    d[user].append(pid)
del d['root']
if d is not None:
    pypprint(d)
```
And if your command hits an exception, pyp will reconstruct a traceback into the generated code.


## More Examples

Implicit Printing: A convenient feature of `pyp` is its attempt to
intelligently print the results of expressions, especially for
dictionaries and iterables, according to GitHub.

```sh
# Example: Output the result of a calculation on each line
$ seq 3 | pyp "x * 2"
2
4
6
```

Controlling line endings: By default, the line variable may include the
line separator unless the `-l` switch is used.

Using `--pre` and `--post` for pre/post-loop actions: The `--pre` (or
`-b`) and `--post` (or `-e`) options in similar tools like pyfil allow
you to define actions to run before or after the main line-by-line
processing loop. This is useful for initialization or final processing
steps.

More explicit looping (if needed): While `pyp` simplifies line-by-line
processing, if you need more explicit control over the loop (e.g., using
for loops in a more complex script-like way), you can combine `pyp` with
other tools or create Python scripts that iterate through input lines.

In essence, `pyp` streamlines working with lines from input streams by
automatically setting up the iteration and providing convenient ways to
interact with each line using concise Python expressions or code
snippets. 


Process each line and assign a variable 'my_var' with a portion of the
line.

```bash
echo -e "first line\nsecond line" | pyp 'my_var = x[:5]; print(my_var)'
```

Process 

```bash
cat data.txt | pyp 'l if int(l) % 2 == 0 else None'

# alternate method

cat data.txt | pyp 'if int(line) % 2 == 0: print(line)'
```

## More Details

### Magic variables

 - use `x`, `l` or `line` to refer to the current line
 - use `i`, `idx` or `index` for the index of current `line` from stdin
 - use `lines` refer to all lines
   
### Options

- Use `--before` or `-b` before the main line-by-line processing loop (initialization)
- Use `--after` `-a` for code after the loop (final processing steps)
- Use `--explain` or `--script` to output a script equivalent to what it would run. 




### Issues:

Can't assign custom variable(s) and use `if` inside loop
Errors in GitHub Readme:
  - Capitalized magic variables: `x` not `X`, `l` not `L`
At least one "TLDR" tool (eg?) has outdated/erroneous info:
  - refers to a conflicting `pyp` (Pyed Piper) tool?
  - `_`, `L` are not supported magic variables
  - `--before` not `--pre`
  - `--after` not `--post`
  - `-a` not `-e` for post processing
  - there is no `-l` option for supressing newlines
    - use `print(x, end="")`

