defmodule Evidencia1 do
    def evidencia1(filein, fileout) do
        data = File.stream!(filein) #line list

        #Using pipes
        example =
            filein
            |> File.stream!() #reads the file and returns a list of rows where the program has to check if there is an email
            # |> Enum.map(&example_from_line/1) #llamas a una funcion que hace que el archivo json se convierta en html. email_from_line the /1 element means that the function takes 1 , 1 row of the array.
            |> Enum.map(&regexNewLine/1)
            |> Enum.map(&regexString/1)
            |> Enum.map(&regexInt/1)
            |> Enum.map(&regexGuion/1)
            |> Enum.map(&regexLlave/1)
            |> Enum.map(&regexCorchete/1)
            |> Enum.map(&regexBools/1)
            |> Enum.join("\n")
            |> IO.inspect() #debugger


        data2 = File.stream!("evidenciaTemplate.html") #line list
        example2 =
            "evidenciaTemplate.html"
            |> File.stream!()
            |> Enum.join("\n")
            |> IO.inspect() #debugger

        #Create the new file
        File.write(fileout, [example2, example, "</p></body></html>"])
    end

    def regexNewLine(file) do
        Regex.replace(~r/\n/, file, "<br>")#This is for the tabs
    end

    def regexString(string) do #Replace Strings

        Regex.replace(~r/"([^"]+)"/, string, "<span class=\"string\">\"\\1\"</span>")
        # Start with <span class="string"> and end with </span> , we use this one to take everything inside the quotes but the quotes
    end

    def regexInt(file) do #Replace numbers (int)
        Regex.replace(~r/(\d+.\d+E[\+|-]\d+|\d+.\d+|\d+)/, file, "<span class=\"int\">\\1</span>")
    end

    def regexLlave(file) do #Replace curly braces
        Regex.replace(~r/({|})/, file, "<span class=\"llave\">\\1</span>")
    end

    def regexCorchete(file) do #Replace the squeare brackets
        Regex.replace(~r/([|])/, file, "<span class=\"corchete\">\\1</span>")
    end

    def regexGuion(file) do #Replace the hyphen
        Regex.replace(~r/(-)/, file,"<span class=\"guion\">\\1</span>")
    end

    def regexBools(file) do
        Regex.replace(~r/(true|false|null)/, file,"<span class=\"bool\">\\1</span>")
    end
end
