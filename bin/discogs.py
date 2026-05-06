#!/usr/bin/env python3

import requests
import subprocess
from argparse import ArgumentParser
from typing import Union, Dict, List, Type


class TokenError(Exception):
    def __init__(self, message=""):
        self.message = "Failed to retrieve token secret: " + message
        super().__init__(self.message)


JSON = Union[Dict[str, "JSON"], List["JSON"], int, str, float, bool, Type[None]]


def capture_shell_command_output(commands: list, shell: bool = False) -> str:
    try:
        result: subprocess.CompletedProcess = subprocess.run(
            commands, capture_output=True, text=True, shell=shell
        )
    except FileNotFoundError:
        raise FileNotFoundError("keymaster CLI tool was not found.")
    return result.stdout.strip()


def query_discogs(
    title: str, artist: str = "", country: str = "", format: str = ""
) -> JSON:
    title = title.replace(" ", "+")
    url = "https://api.discogs.com/database/search?q="
    token: str = capture_shell_command_output(["keymaster", "get", "DiscogsToken"])

    if token.startswith("Error "):
        raise TokenError(token)

    if format not in ["Single", "Album", ""]:
        raise ValueError(
            f'Invalid value "{format}" for format. Expected "Single" or "Album".'
        )

    if artist:
        artist = "&artist=" + artist.replace(" ", "+")

    if country:
        country = "&country=" + country.replace(" ", "+")

    if format:
        format = "&format=" + format

    url = url + title + artist + country + format + "&type=release&token=" + token
    response = requests.get(url)

    # return the JSON response as a Python dictionary
    return response.json()


def find_earliest_release(data: dict) -> dict:
    earliest_release: dict = {"year": "9999", "uri": "No result found."}
    for result in data["results"]:
        try:
            if int(result["year"]) < int(earliest_release["year"]):
                earliest_release = result
        except KeyError as e:
            continue
    if earliest_release["year"] == "9999":
        raise Exception("No release with release year data found.")
    return earliest_release


def main() -> None:
    parser = ArgumentParser(
        description="Find the original year a song was released and it's genre from Discogs."
    )
    parser.add_argument("title")
    parser.add_argument("-a", "--artist", nargs="?", type=str, default="")
    parser.add_argument("-c", "--country", nargs="?", type=str, default="US")
    parser.add_argument("-f", "--format", nargs="?", type=str, default="")
    args = parser.parse_args()
    if args.country.lower() == "all":
        args.country = ""
    APIData = query_discogs(
        args.title, artist=args.artist, country=args.country, format=args.format
    )
    earliest_release = find_earliest_release(APIData)
    genres = earliest_release["genre"] + earliest_release["style"]
    genre_list = ", ".join(map(str, genres))
    print(f"{earliest_release['year']}\t{genre_list}")


if __name__ == "__main__":
    main()
