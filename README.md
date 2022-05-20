# Reflection of proposed solution, implemented algorithms and conclusions
Team 13
Ariadne Alvarez Reyes | A01652080
Alejandro Fernández del Valle Herrera | A01024998

## Explanation of the function

To run, load the file `evidencia1.exs` to elixir, and then use the following functions:

### Evidencia1.evidencia1 (readFile, outFile)

> This function takes in a JSON file, and outputs it colorized as HTML in outfile.

Args:
- **readFile**: File to read, must be JSON inf path format. *(example; "test.json")*
- **outFile**: File to set as output. Must be set as HTML, WILL DELETE CURRENT FILE WITHOUT WARNING. *(example: "output.html")*

**Ussage**
```
Evidencia1.evidencia1("/home/download/example.json", "/home/documents/parsedJSON.html")
```

Will load the JSON file located in `/home/download/example.json` and save the parsed document in html in `/home/documents/parsedJSON.html`.

> NOTE: if you make file outside of folder, please coppy style.css to same folder as html

## Solution to problem

We experimented with pattern matching and Finate State Machine (FSM). As we studied in class we can use many algorithms to create a solution depending on the problem. On this evidence we define an s-expression-based notation for representing regular expressions. To made this solution we used elixir as our programming language. The reason was because for its ability in the use of pattern matching with regex.

## Algorythms used

We used regex for pattern matching. As part of the pattern matching, we had to figure out all the tokens that the language JSON has. 

Once we had the patter matching down, using Regex, we used this to replace and add all the needed html tags.

To make things easier, we used css span classes to colorize everything.

## Conclusion

We think this algorythm is one that can run quite fast, has a better solution and also it is the one with the best optimization. While also being mostly accurate. In order to make an algorythm that can dettect errors, we need to use either more complex patterns, or a finate state machine. However, this compromises on the speed of the algorythm, meaning that we decided to make one that can be implemented in something like a lightweight editor.

Using regex is a great way to solve complex problems in simple and creative ways. And we show this in our code, where we manage to reach the final goal without the need to do harcoding or repetitive functions. Which helped us to have a more readable and simple work.