Exit python interpreter

```python
exit()  # or ^D (EOF)
```

Get help/documentation on python built-ins and installed modules/packages:

`$ pydoc3 'function_name'`

or in REPL

```python
>>> help("function_name")
```

advanced python REPLs:

```console
$ ptpython
$ bpython
$ ipython
```

<hr/>

### [KEYWORDS](https://realpython.com/python-keywords/)

```python
>>> help('keywords')
False               class               from                or
None                continue            global              pass
True                def                 if                  raise
and                 del                 import              return
as                  elif                in                  try
assert              else                is                  while
async               except              lambda              with
await               finally             nonlocal            yield
break               for                 not                 
```

Value keywords
```python
True    # canonical boolean true
False   # canonical boolean false
None    # null value or no value 


>>> x = True
>>> x is True
True

>>> y = False
>>> y is False
True

# As opposed to "truthy" or "falsy" (evaluates as True or False)
>>> x = "this is a truthy value"
>>> x is True
False
>>> bool(x) is True
True

>>> y = ""  # This is falsy
>>> y is False
False
>>> bool(y) is False
True

# Note: all value keywords are singletons, 
# there is only one python object for each value
>>> x = True
>>> id(x)
4336519216
>>> id(True)
4336519216
```

The `None` keyword is used to define a null value, or no value at all.

- `None` is not the same as `0`, `False`, or an empty string. 
- `None` is a singleton (there is only one and only one `None` in python)
   you can check if a `var` is `None` with the `is` keyword
- It is useful when you want to use a function parameter/argument
  with default initial "no value" as None is immutable


```python
>>> z = None
>>> z is None
True
```

Flow Control Keywords
```python
if      # start conditional statement
elif    # optional, can use as many as needed
else    # optional, execute only if all other block conditions are false
```

Operator Keywords
```python
and
or
not 
in  # containment check
is  # identity check: checks if two objects are exactly
    # the same object (have same ID):
      True, False, None
```
Iteration Keyboards (loops)
```python
for       # loop a determined number of times
while     # loop while condition is True
break     # exit while loop
continue  # continue next loop iteration (jump to start of loop)
else      # execute after while loop if exited normally (no break called)
```

Structure Keywords
```py
with         # context managers
as           # alias to name
pass         # no operation
lambda       # anonymous function that lets you write quick, 
             # inline functions without using the def keyword
def          # define a function
class        # bundle data and functionality together
```
Returning Keywords (functions)
```python
return  # - returns None by default 
yield   # - returns a generator 
        # - turns a function in a generator function
        # - used to get a series of values one at a time 
        #   by calling function again and again
```

Exception-Handling Keywords
```python
try
except
raise
finally
else
```

Asynchronous Keywords
```python
async
await
```


Deprecated Keywords
```python
print   # replaced by print()
exec    # replaced by exec()
# still not a good idea to reuse as variable names
```

Scope Handling Keywords

```python
del       # unset a variable or name, more common use to
          # remove indexes from a list or dict
global    # specify variables are pulled into the function
          # from the global scope
nonlocal  # similiar to global i.e. different scope, 
          # but from a parent scope
```

Soft Keywords (introduced in python 3.10)

- identifiers that are reserved only in specific contexts
  where their use as keywords makes syntactic sense
- prevent breaking existing code that might have used these names
- as opposed to  hard keywords (always reserved words), even in 
  positions where they make no sense (e.g. x = class + 1)
- Examples:
    - `_` 
    - `match` / `case` (introduced in python 3.10)
    - `type` (introduced in python 3.12)

<hr/>

```python
# Tuples (immutable)
tuple1 = ()
```

```python
# Lists (mutable)
list1 = []             # initialize as empty list
list1[i:j]             # returns list subset
list1[-1]              # returns last element
list1[:-1]             # returns all but the last element
*list1                 # expands all elements in place
list1[i] = val         # change value of item i i list to val
list1[i:j] = list2     # replace ith to jth-1 elements with otherlist
del list1[i:j]         # delete slice 
del record[-1]         # delete last element
list1.append(item)     # add new item to end of list
list1.extend(list2)    # append another_list to the end of list1 (modifies list1)
list1 + list2          # returns the combined lists
list1.insert(i, item)  # add to list at index i, moving later elements one index up
list1.pop()            # returns and removes last element from the list
list1.pop(i)           # returns and removes i-th element from the list
list1.remove(i)        # removes the first item from the list whose value is i
set(list1)             # remove duplicate elements from a list
list1.reverse()        # reverses the elements of the list in-place
list1.count(item)
sum(list1)
list1.sort()           # sorts in-place, returns None
sorted(list1)          # returns sorted copy of list
",".join(list1)        # returns a string with list elements seperated by comma
```

zip function

```python
# class zip(object)
#     ...
zip(*iterables, strict=False)   # Yield tuples until an input is exhausted.

zip(list1, list2)  # returns list of tuples with n-th element of both list1 and list2

# REPL:
>>> list(zip('abcdefg', range(3), range(4)))
[('a', 0, 0), ('b', 1, 1), ('c', 2, 2)]

# sum items in multiple lists
totals = [sum(t) for t in zip(list1, list2)]
```

Dict

```python
dict1 = {}
dict1 = {
  "brand": "Ford",
  "model": "Mustang",
  "year" : 1964
}
dict1.keys()
dict1.values()
"key" in dict1                # let's say this returns False, then...
dict1["key"]                  # ...this raises KeyError
dict1.get("key")              # ...this returns None
dict1.setdefault("key", 1)
dict(sorted(mydict.items()))  # sort dict by keys
```

Iteration
```python
for item in ["a", "b", "c"]:
    pass
for i in range(4):                     # 0 to 3
    pass             
for i in range(4, 8):                  # 4 to 7
    pass             
for i in range(1, 9, 2):               # 1, 3, 5, 7
    pass
for key, val in dict1.items():
    pass
for index, item in enumerate(list1):
    pass
```


String
```python
str1[0:4]            # returns the first 3 characters in the string
len(str1)
string1.replace("-", " ")
",".join(list)       # returns a string with list elements seperated by commas
"hi {0}".format('j') # returns "hi j" based on numbered argument format
f"hi {name}"         # same as "hi {}".format('name')
str1.find(",")
str1.index(",")      # same, but raises IndexError
str1.count(",")
str1.split(",")      # returns a list of substrings split by ","
str1.lower()
str1.upper()
str1.title()
str1.lstrip()
str1.rstrip()
str1.strip()

these methods return True/False:
  str1.islower()
  str1.isalnum()
  str1.isalpha()
  str1.isascii()
  str1.isdecimal()
  str1.isnumeric()
```

Escape Characters

```python
'doesn\'t'  # use \' to escape the single quote...
"doesn't"
"doesn't"  # ...or use double quotes instead
"doesn't"
'"Yes," they said.'
'"Yes," they said.'
"\"Yes,\" they said."
'"Yes," they said.'
'"Isn\'t," they said.'
'"Isn\'t," they said.'
test if string in string
'a' in 'abc'
```

Test multiple strings in string

```python
any(s in 'abc' for s in ('a', 'b', 'd'))
all(s in 'abc' for s in ('a', 'b', 'd'))
```

<hr/>

Casting (change data type)

```python
int(str1)
float(str1)
str(int1)
str(float1)
'string'.encode()
```

<hr/>

Comprehensions

```python
[fn(i) for i in list1]            # .map
map(fn, list1)                    # .map, returns iterator
filter(fn, list1)                 # .filter, returns iterator
[fn(i) for i in list1 if i > 0]   # .filter.map
```

<hr/>

Math

```python
>>> .1 + .2 == .3
False
>>> .1 + .2
0.30000000000000004
>>> round(.1 + .2, 2) == .3
True
>>> round(.1 + .2, 2)
0.3
>>> round(.1 + .2, 4) == .3
True
>>> round(.1 + .2, 4)
0.3
```

<hr/>

Don't use div and mod separately for both `q` & `r`; use `divmod()`

```python
q, r = x // p, x % p # repeats the calculation
q, r = divmod(x, p)

from fractions import Fraction
Fraction("2/3") * Fraction("66/13")
Fraction(44, 13)
```

Don't use filter / map; generator or list comprehension is more readable

```python
filtered = filter(<func>, <iter>)
filtered = (x for x in <iter> if <func>(x)) # generator object
filtered_list = [x for x in <iter> if <func>(x)]
```

```python
mapped = map(<func>, <iter>)
mapped = (<func>(x) for x in <iter>) # generator object
mapped_list = [<func>(x) for x in <iter>]
```

<hr/>

Regex
```python
import re
re.match(r'^[aeiou]', str1)
re.sub(r'^[aeiou]', '?', str1)
re.sub(r'(xyz)', r'\1', str1)
expr1 = re.compile(r'^...$')
expr1.match(...)
expr1.sub(...)
```

<hr/>

##### FUNCTIONS

Positional arguments (ordered args)

- positional arguments must agree in order and number with 
  the parameters declared in the function definition.

Keyword arguments (named arguments)

- keyword arguments must agree with declared parameters in number, 
  but they may be specified in arbitrary order.
  positional arguments must come before keyword arguments
- once you use keyword arguments, you cannot use positional arguments
  optional parameters (that have default values) are keyword arguments 
  by necessity
- optional/default parameters allow some arguments to be omitted when 
  the function is called.

Positional parameters, argument tuple packing (`*args`), and argument 
dictionary packing (`**kwargs`) can all be used in a single function 
definition. But they *must* be in this order:

- standard positional arguments
- `*args`
- `**kwargs`

```python
  def f(a, b, *args, , **kwargs) :
    pass
```


Positional-Only and Keyword-Only Arguments can be combined

```python
def f(x, y, /, z, w, *, a, b):
    print(x, y, z, w, a, b)
x & y must be provided positionally
a & b must be provided using their keywords
z & w can be provided either way.
```


<hr/>

#### Packing / Unpacking

Tuples 

```python
def f(*args):
    print(type(args), args)
by convention packed tuple is called args in function def
denoted by the * symbol
my_tuple = (1, 2, 3)
f(*my_tuple)
```


Dicts

```python
def f(**kwargs):
    print(type(args), args)
by convention packed dict is called kwargs (keyword args) in function def
denoted by the ** symbol
my_dict = {'a' : 1, 'b' : 2, 'c' : 3}
f(**mydict)
```

<hr/>

Variables at top level of scripts are `globals`


```python
var = 1

def f1():
    var += 1    # uses global
    print(var1)

# Define global var inside function, normally function declares local vars

def f2():
    globals()['var1']  = 1

f2()   # var1 is now equal to 1 in the global scope
```

Functions only return one object (including `None`)

- To return multiple objects use an iterable, e.g. tuple, list, etc.
- To return the elements of a list individually use a tuple

```python
def f():
    my_list = [1, 2, 3]
    return tuple(my_list) 
    # returns three items: 1, 2, 3  which is same as (1, 2, 3) in python
```

Pass args and/or kwargs (keyword args: dict) to another function

```python
def print_error(*args, **kwargs):
    print("Error:", *args, **kwargs)
```



<hr/>

##### FILE MANIPULATION


File Reading

```python
file = open("hello.txt", "r") # open in read mode 'r'
file.close() 
print(file.read())    # read the entire file and set the cursor at the end of file
print file.readline() # Reading one line
file.seek(0, 0)       # place the cursor at the beginning of the file
Writing (overwrite)
file = open("hello.txt", "w") # open in write mode 'w'
file.write("Hello World") 
text_lines = ["First line", "Second line", "Last line"] 
file.writelines(text_lines)
file.close()
```

File Writing (append)

```python
file = open("Hello.txt", "a") # open in append mode
file.write("Hello World again")  
file.close()
```


File Context manager

```python
with open("welcome.txt", "r") as file:
    # 'file' refers directly to "welcome.txt"
   data = file.read()
# This loop closes the file automatically at the end of scope,
# no need for `file.close()`.
```

The argument mode points to a string beginning with one 
of the following sequences (Additional characters may follow
these sequences):
 
|       |
|:-----:|:--------------------------------------------------------------
| "r"   | Open text file for reading.  The stream is positioned
|       | at the beginning of the file.
|       |
| "r+"  | Open for reading and writing.  The stream is positioned
|       | at the beginning of the file.
|       |
| "w"   | Truncate file to zero length or create text file for writing.
|       | The stream is positioned at the beginning of the file.
|       |
| "w+"  | Open for reading and writing.  The file is created if it does
|       | notexist, otherwise it is truncated.  The stream is positioned
|       | at the beginning of the file.
|       |
| "a"   | Open for writing.  The file is created if it does not exist.
|       | The stream is positioned at the end of the file.  Subsequent
|       | writes to the file will always end up at the then current end,
|       | of fileirrespective of any intervening fseek(3) or similar.
|       |
| "a+"  | Open for reading and writing.  The file is created if it does
|       | notexist.  The stream is positioned at the end of the file.
|       | Subsequent writes to the file will always end up at the then
|       | currentend of file, irrespective of any intervening fseek(3)
|       | or similar.

|                   |  r  |  r+ |  w  |  w+ |  a  |  a+ | 
|-------------------|:---:|:---:|:---:|:---:|:---:|:---:|
| read              |  +  |  +  |     |  +  |     |  +  | 
| write             |     |  +  |  +  |  +  |  +  |  +  | 
| write after seek  |     |  +  |  +  |  +  |     |     | 
| create            |     |     |  +  |  +  |  +  |  +  | 
| truncate          |     |     |  +  |  +  |     |     | 
| position at start |  +  |  +  |  +  |  +  |     |     | 
| position at end   |     |     |     |     |  +  |  +  | 
 

|---------------------|-------------------------------------------------
| read                | reading from file is allowed                    
| write               | writing to file is allowed                      
| create              | file is created if it does not exist yet        
| truncate            | during opening of the file it is made empty     
|                     | (all content of the file is erased)             
| position at start   | after file is opened, initial position is set to
|                     | the start of the file                           
| position at end     | after file is opened, initial position is set to
|                     | the end of the file                             

Note: a and a+ always append to the end of file - ignores any seek movements.

[File mode flow chart diagram from Stack Overflow]
(https://stackoverflow.com/questions/1466000/difference-between-modes-a-a-w-w-and-r-in-built-in-open-function)
https://d20p74l5mne5au.cloudfront.net/ExWNT-white-bg.png

<hr/>

To check whether a Path object exists (file or directory):

```python
my_file = Path("test.txt")
if my_file.exists():    # path exists
    ...
```

To check if file:

```python
from pathlib import Path
if my_file.is_file():   # file exists
    ...
```

To check a directory, do:

```python
if my_file.is_dir():    # directory exists
    ...
```

You can also use resolve(strict=True) in a try block:

```python
try:
    my_abs_path = my_file.resolve(strict=True)
except FileNotFoundError:    # doesn't exist
    ...
else:                        # exists
    ...
```

<hr/>

Python2 uses ASCII by default, not unicode

```python
#!/usr/bin/python
# -*- coding: utf-8 -*-
```
<hr/>

Process HTML/XML with Beautifulsoup (BS4) e.g. web scraping
[BeautifulSoup Method Names]
(https://www.crummy.com/software/BeautifulSoup/bs4/doc/#method-names)

```python
import requests
from BS4 import Beautifulsoup
url = "https://www.example.com/test.html"
reponse = requests.get(url, headers=headers)
soup = Beautifulsoup(response.text, 'html.parser') # response.content is identical
soup.prettify
soup.find_all("a")    # same as soup.findAll (BS3e)
                      # same as soup.findChildren (B2)
soup.find_all('cite') # works for <cite> but soup.find_all('<cite>') does not
link.get('<string')   # e.g. link.get('href')
link.string           # text of link tag
```

<hr/>

List Comprehensions: create lists from other sequences in a very concise way

```python
[ <expression> for <name> in <iterable or sequence> ]
```

```python
# non-pythonic method
num_list = [1,2,3,4,5]
cube_list = []
for num in num_list:
  cube_list.append(num**3)
print(cube_list) # output is [1,8,27,64,125]

# use list comprehension
num_list = [1,2,3,4,5]
cubes = [num**3 for num in num_list]
print(cubes) # output is [1,8,27,64,125]

# List comprehension with calculation
list_of_strings = [‘hello’, ‘my’, ‘name’, ‘a’]
len_of_strings = [len(word) for word in list_of_strings]
print(len_of_strings) # output is [5,2,4,1]

# List Comprehension with Condition
[ <expression> for <name> in <iterable or sequence> if <condition>]

# cubes of elements of num_list less than 20
[num**3 for num in num_list if num**3 < 20]

cubes_of_odds = [num**3 for num in num_list if num%2 != 0]
```

<hr/>

The Walrus Operator (Python 3.8+), formally the assignment expression operator
`:=` looks like a walrus emoji (two eyes and two long tusks)
accomplishes two tasks at once: assigning a value to a variable, and returning that value

```python
# old method
value = input ('Please enter something: ")
while value != ""
    print( 'Nice!')
    value = input( 'Please enter something: ')

# Wlarus operaor version
while (value := input('Please enter something: ") != "'):
    print('Nice!')
```

<hr/>

#### Foot Guns

Don't modify (delete or insert) while looping/iterating over lists, 
instead use one of these methods:

- Using list comprehension to create a new list containing only the
  items that meet a specific condition, which is more efficient and cleaner.
- Create a new list and appending items that meet the condition, rather than
  removing items from the original list.
- Use a while loop with an explicit index, where the index is not incremented
  after a removal to account for the shifting elements.


There is an issue I haven't figured out with lists

```python
>>> tuple([1])
(1,)
# which is not the same as 1; you iterate it one value/item: 1
# but not equivalent to the integer as the tuple (1) is
# A workaround is to conditionally return the first element 
# of the list if only one element

def f():
    my_list = [1]
    if len(my_list) == 1:
        return my_list[0]
    else:
        return tuple(my_list)
```

<hr/>

##### EXAMPLE CODE

Clear the screen

```python
import os
os.system('cls' if os.name == 'nt' else 'clear')
```

Pretty print a json

```python
python -m json.tool foo.json
```

Print path to python interpreter

```python
import sys
print(sys.executable)
```

Parse date string and change format

```python
>>> import datetime
>>> datetime.datetime.strptime('Mon Feb 15 2010', '%a %b %d %Y').strftime('%d/%m/%Y')
'15/02/2010'
```

Get home dir path

```python
from pathlib import Path
str(Path.home())
```

Print error to stderr and exit

```python
import sys
print(_("Error text goes here"),file=sys.stderr)
sys.exit(1)
```

Check website ISITUP / ISITDOWN (example only, isitup.org is defunct)

```python
import subprocess
url = "http://checked-domain.org/more/path/"
domain = urlparse(url).netloc
result = subprocess.run(['/opt/homebrew/bin/is-up', domain], stdout=subprocess.PIPE)
if result.returncode == 0:
    print(f"ERROR: {domain} is UP per isitup.org but unreachable from this network.")
else:
    print(f"ERROR: {domain} is DOWN per isitup.org!")
```

[Get exit code and stderr from subprocess call - Stack Overflow]
(https://stackoverflow.com/questions/16198546/get-exit-code-and-stderr-from-subprocess-call)

```python
import sys
import subprocess

try:
    subprocess.check_output(cmd, stderr=subprocess.PIPE)
except subprocess.CalledProcessError as e:
    print('exit code: {}'.format(e.returncode))
    print('stdout: {}'.format(e.output.decode(sys.getfilesystemencoding())))
    print('stderr: {}'.format(e.stderr.decode(sys.getfilesystemencoding())))

shell commands
import subprocess
subprocess.Popen('ls -la', shell=True)
subprocess.Popen(args, 
                bufsize=0, 
                executable=None, 
                stdin=None, stdout=None, stderr=None, 
                preexec_fn=None, close_fds=False, 
                shell=False, 
                cwd=None, env=None, 
                universal_newlines=False, 
                startupinfo=None, 
                creationflags=0)
```
Break a shell command into a sequence of arguments, especially in complex cases.
shlex.split() can do the correct tokenization for args

```python
import shlex
from subprocess import Popen, PIPE
command = shlex.split('swfdump /tmp/filename.swf/ -d')
process = Popen(command, stdout=PIPE, stderr=PIPE)
stdout, stderr = process.communicate()
```

URI/URI validator

```python
try:
    # python2
    from urlparse import urlparse
except:
    # python3
    from urllib.parse import urlparse

def validate_uri(uri: str) -> bool:
    try:
        result = urlparse(uri)
        return all([result.scheme, result.netloc])
    except:
        return False

def validate_url(url:str) -> bool:
    return url.startswith('http') and validate_uri(url)

import requests
def validate_url(url:str) -> bool:
    return (url.startswith('http') and 
            validate_uri(url) and
            requests.get(url).status_code == 200
    )

def validate_url(url:str) -> bool:
    if url.startswith('http') and validate_uri(url):
        return requests.get(url).status_code == 200
    else:
        return False
```

[How to build URLs in Python with the standard library?]
(https://stackoverflow.com/questions/15799696/how-to-build-urls-in-python-with-the-standard-library)

```python
from collections import namedtuple
from urllib.parse import urljoin, urlencode, urlparse, urlunparse
namedtuple to match the internal signature of urlunparse
Components = namedtuple(
    typename='Components', 
    field_names=['scheme', 'netloc', 'url', 'path', 'query', 'fragment']
)
query_params = {
    'param1': 'some data', 
    'param2': 42
}
url = urlunparse(
    Components(
        scheme='https',
        netloc='example.com',
        query=urlencode(query_params),
        path='',
        url='/',
        fragment='anchor'
    )
)

print(url)
# Output: https://example.com/?param1=some+data&param2=42#anchor
```

Usa a tuple to test for multiple substrings

```python
'Ch. 1'.startswith(("Prologue", "Epilogue", "Chapter", "Ch.", "Part ", "Pt."))
```

Check if any substring from a list is present in a string in Python:

```python
s = "Python is powerful and versatile."
search = ["powerful", "versatile", "fast"]
Check if any element in the list exists in the string
result = any(elem in s for elem in search)
print(result)  # Output: True
returns True or False
# Invert to check in none of the substrings are present
result = not any(elem in s for elem in search)
result = all(not elem in s for elem in search)
```

[Python match case statement]
(https://learnpython.com/blog/python-match-case-statement/)

```python
def file_handler_v2(command):
    match command.split():
        case ['show']:
            print('List all files and directories: ')
            # code to list files
        case ['remove' | 'delete', *files] if '--ask' in files:
            del_files = [f for f in files if len(f.split('.'))>1]
            print('Please confirm: Removing files: {}'.format(del_files))
            # code to accept user input, then remove files
        case ['remove' | 'delete', *files]:
            print('Removing files: {}'.format(files))
            # code to remove files
        case _:
            print('Command not recognized')
```

```python
>>> file_handler_v2('remove --ask file1.txt file2.jpg file3.pdf')
Please confirm: Removing files: ['file1.txt', 'file2.jpg', 'file3.pdf']
>>> file_handler_v2('delete file1.txt file2.jpg file3.pdf')
Removing files: ['file1.txt', 'file2.jpg', 'file3.pdf']
```

Convert a string with HTML tags  to bs4.element.Tag:

```python
htmlStr = '<li>Coffee</li>'
soup = BeautifulSoup(htmlStr, 'html.parser')
tags = soup.find_all('li')
```

So, given that you have a pandas dataframe like this:

```html
              tags
0  <li>Coffee</li>
1     <li>Tea</li>
2   <li>Water</li>
You can create a function to convert the HTML like string to bs4.element.Tag:
```

```python
def str_to_bs4(x):
    html_soup = BeautifulSoup(x, 'html.parser')
    html_tags = html_soup.find_all('li')
    return html_tags
```
Now use the lambda function to pass string from each row and convert them back by calling the function:

```python
df['tags_bs4'] = df['tags'].apply(lambda x: str_to_bs4(x))
```

<hr/>

[Find multiple tags in bs4 Beautifulsoup]
(https://stackoverflow.com/questions/20648660/python-beautifulsoup-give-multiple-tags-to-findall)

```python
tags = soup.find_all(['hr', 'strong'])

import re
get_tags = soup.findAll(re.compile(r'(hr|strong)'))
```

To find multiple tags, you can use the `,` CSS selector, 
where you can specify multiple tags separated by a comma `,`.

To use a CSS selector, use the `.select_one()` method instead of `.find()`, 
or `.select()` instead of `.find_all()`.

For example, to select all `<hr>` and `strong` tags, separate the tags with a `,`:

```python
tags = soup.select('hr, strong')
```
<hr/>

For quick & dirty timing tests, use timeit decorator

```python
>>> @timeit
... s=''
... for i in range(1000000):
...    s+='A'
... 
56.7 ms ± 1.17 ms per loop (mean ± std. dev. of 7 runs, 10 loops each)
```

Show value of unprintable iterable

```python
def display_iter(i):
    print(', '.join([str(e) for e in i]))

# alt: use rich library to inspect objects including some iterables:
from rich import inspect
inspect(range(4), methods=True)
```

Reverse strings, lists and other iterables 
(less efficient than built-in reversed() but printable)

```python
def reverse(i: iter) -> iter:
    return i[::-1]
```

Time code with Python decorators

```python
import time
def time_it(func):
    def wrapper():
        t1 = time.time()
        func()
        t2 = time.time() - t1
        print(f" {func.__name__} ran in {t2} seconds")
    return wrapper

@time_it
def do_this():
    # Simulating running code..
    time.sleep(1.3)
```

Check if string has any letters

```python
def has_alpha(s: str) -> bool:
    return any(char.isalpha() for char in s)
```

Roman numerals test (strict)

```python
def is_roman_numeral(numeral: str) -> bool:
    valid_chars : set[str] = set("MDCLXVI")
    return all(char in valid_chars for char in numeral)
original version

def is_roman_numeral(numeral):
    valid_chars = set("MDCLXVI()")
    return all(char in valid_chars for char in numeral.upper())
```

Check for valid IPv4 or IPv6 address (tag: ip address)

```python
import ipaddress
ipaddress.ip_address('${IP_ADDR}')
```

Decorators example: timer for functions
(a decorator is a function wrapper function)

```python
import time
def timer(func):
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"Function {func.name_!r} took: {end_time - start_time:.4f) seconds")
        return result
    return wrapper

@timer 
def sum_to_ten_million():
    total = 0
    for i in range (10_000_000):
        timer += 1
    print(total)
run function with timer decorator

# REPL
>>> sum_to_ten_million()
10000000
Function sum_to_ten_million took: 0.2842 seconds
```


Remove File Extension Python

```python
import os
def remove_extension(filename):
    name, _ = os.path.splitext(filename)
    return name
```

Split a string based on more than one separator

```python
import re
re.split(r"\ |\.|_", "one two.three_four")

# Alternate for only two separators
"one two.three".replace(".", " ").split()
```
 
<hr/>

### Example Code



```python 
# wild card matching / pattern matching
def sum_ingredients (ingredient_counts) :
    match ingredient_counts:
    case []:
        return 0
    case [first, *rest]:
        return first + sum_ingredients (rest)
    case _
        raise ValueError (f"Can only sum lists.")
```

```python
def scream(input_str):
    print (f" {input_str.upper()}!")

class CustomError (Exception):
    pass

with open ('data.txt', 'r') as f:
    data = f. read ()

ids = ["1". "3" "10". "2"1
sorted_ids = sorted(ids, key=lambda id_str: int(id_str))
# default would sort alpbaetically; this example sorts numerically
```

```python
def items_per_person (num_items, num_person) :
assert num_items > 0

try:
    items_per-person = num_items / num_person
except ZeroDivisionError:
    print( "There are no people : (")
    raise
else:
    print(f"Each person gets {items_per-person} items.")
finally:
    print(f"Shared {num_items> items with {num_person? person.")
return items per person
```

<hr/>

```python
import asyncio
import socket
from http.client import HTTPConnection

async def check_host_connectivity(url):
    connection = HTTPConnection (ur1)
    try:
        connection. request ("HEAD", "/")
        return f"furl} is online!"
    except socket.error:
        return f"{url} is not online!"
    finally:
    connection.close()

async def asynchronous_check(urls):
    async def _check(url):
        response = await check_host_connectivity(url)
        print (response)
    await asyncio.gather (*(_check(url) for url in urls))

urls = ["www.python.org", "www.real-python.com" ]
asyncio.run(asynchronous_check(urls))

del response ["headers" ] 
del response["errors"]
```

<hr/>

```python
all numbers = []
def mean ():
    total = 0
    length = 0
    def _mean (number):
        global all_ numbers 
        nonlocal total, length 
        total += number length += 1
        all_numbers.append (number)
        return total / length 
    return mean
```

<hr/>

```python
def cube (num):
    return num**3
num_list = [1,2,3,4,5]
cube() is called twice
cubes = [cube (x) for x in num_list if cube(x) < 20]


cube is only called once with walrus operator in list comprehension
cubes = [y for x in num_list if (y := cube(x)) < 20]
```
