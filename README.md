# Visual Basic


## Contents

1. [Getting Started](#Getting-Started)
2. [Guessing Game](#Guessing-Game)

Made by Joe Loach

---

## Getting Started

Welcome to Visual Basic! There's a lot to learn, but every journey starts somewhere. In this chapter we'll talk about:

* [Creating a new Project](#Creating-a-new-project)
* [Writing a program that prints `Hello, World!`](#Hello,-World!)
* [Managing your project](#Managing-your-project)

---

### Creating a new project

Visual Studio is an IDE that allows you to create projects.
Projects come in many flavours, but you'll mainly be working in a _Console Application_.

Lets start by showing you how to create a new project!

Open Visual Studio and enter the following key combination:

> Control + Shift + N

This will open a prompt for you to create a new project!
Navigate to the `Visual Basic` Tab on he side of the window, and click on `Console Application`.

Give that Console App any name and press OK.
I gave my Application the name _"Hello World"_

**Congratulations**, you have successfully created a new project for you to start coding in! Give yourself a pat on the back...

---

### Hello, World!

Now that you've created your first project and given it a name, let's do some actual coding **!**

It's an unwritten tradition when learning a new language to write a program that prints _"Hello, World"_ to the screen, so we'll do the same too!

When you created the project, some code will have already been made for you:

```vb
Module Module1

    Sub Main()
        
    End Sub

End Module
```
Don't worry about what all this means for now. Simply copy the following line into `Sub Main()` :
```vb
Console.WriteLine("Hello, World!")
```
If you copied correctly, your program should now look like this:

```vb
Module Module1

    Sub Main()
        Console.WriteLine("Hello, World!")
    End Sub

End Module
```

**Nice!** To run your code, press `Control + F5` on your keyboard!

**Awesome!** If you can see `"Hello, World!"` on a window, you're officially a Visual Basic programmer, congratulations!

To close the program press any key.

---

### Managing your project

Now that you've created and ran your own application lets analyse what each part of your project does:

Firstly, `Sub Main()`:

```vb
Sub Main()
...
End Sub
```

These lines define the start and end of a subroutine in VB. The `Main` subroutine is special: It is the starting point of your program. The declaration of `Main` has no parameters and returns nothing. If the subroutine did have parameters, they would go inside the parentheses, `()`.
Also notice that our sub `Main` has a beginning and an ending. All blocks in VB have a beginning and ending.

Inside our `Main` subroutine is the following code:

```vb
Console.WriteLine("Hello, World!")
```

All this line does it output text to the screen. Alike our `Main` subroutine, `Console.WriteLine` is also a subroutine, as it returns no value. Unlike `Main` it takes in one argument, the text that we want to output to the screen. In our case it is the string `"Hello, World!"`.

Penultimately, we have `Modules`:

```vb
Module Module1
...
End Module
```
You don't really need to know much about these. However, the sub `Main` must always be placed inside of one, otherwise it won't be recognised as the starting point of your program!

You can rename the `"Module1.vb"` whilst in Visual Studio and it will automatically change the name of the module too.
To make my overall code more understandable, I have renamed `"Module1.vb"` to `"Program.vb"`. This also changes the name of the module name inside of my code to:
```vb
Module Program
...
End Module
```

Check your program still runs if you made this change along with me by pressing `Control + F5`.

---

## Guessing Game

This chapter will introduce you to a few programming concepts in Visual Basic and show you how to use them in a real program.

We are going to be creating a Guessing Game. You might want to create a new project for this and start with a blank slate.

Here's how it's going to work:
1. The program will generate a random number between 1 and 100.
2. It will prompt the user to input a number.
3. It will tell the user if the guess it too high, or too low.
4. If the guess is correct it will print a congratulatory message and close.

---

### Processing a guess

One of the parts of our guessing game is taking in user input, processing that input and checking the input is in the correct form.

```vb
Module Program

    Sub Main()
        Console.WriteLine("Guess the number!")

        Console.WriteLine("Please input your guess.")

        Dim guess As String

        guess = Console.ReadLine()

        Console.WriteLine("You guessed: " + guess)
    End Sub

End Module
```

This code contains a lot of information, so i'll go over it line by line.

As you saw in Chapter 1, the `Main` subroutine is the entry point into the program. And the `End Sub` declares the end of our program.

You also learned that Chapter 1, `Console.WriteLine()` is a subroutine that outputs a string to the Console Window.

#### Storing values with Variables

Next, we'll need to create a place to store the input of the user, like this:

```vb
Dim guess As String
```

The keyword called `Dim` stands for "**D**eclare **I**n **M**emory", and it creates space in memory for a variable.

It is always good practise to name your variable appropriately so you and other people can understand the usage of a variable in your program better.

Visual Basic is a statically typed language. This means that every Variable must be given a `Type`. 

The Type used in the example above is `String`. A `String` is a collection of `Characters` and is used to store words and sentences. For example:

```vb
"I am a String, I have quotes around me to show I'm a String"
```

The line below creates a variable called `foo` and assigns it's value to `bar`.

```vb
Dim foo = bar
```

> Note: Never name your variables "foo" or "bar", they have no meaning!

There are many different types in Visual Basic and in later chapters you'll be taught how to create your own.

Sometimes, the compiler can infer what the `Type` of a variable is. This saves writing a longer named type and makes your code slightly easier to understand.

Returning to our guessing game program. You now know that `Dim guess As String` will create a new variable called `guess`.

Let's have a look at the next line:

```vb
guess = Console.ReadLine()
```

We can see that a function is being called. We know that it is a function because it returns a value. `ReadLine()` Returns a `String` of what the user inputted into then Console.
The value of the variable named `guess` is then set to the return value of `Console.ReadLine()`.

Finally, the last line in the `Main` subroutine.

```vb
Console.WriteLine("You guessed: " + guess)
```

Two things are going on here:
1. You know from Chapter 1, that this subroutine prints text to the Console.
2. Two strings are being `Concatenated`. This is a fancy word for "Put together". 

If the program just printed the value of `guess` how would the user know what it was? It could be anything! By `Concatenating` the two strings we give context to our data so the user understands it better.

#### Printing Values with `WriteLine()` Arguments

Instead of `Concatenating` strings to print out, we can instead use an _overload_ of `WriteLine()`. It's signature can be found below:

```vb
Public Shared Sub WriteLine (String format, Object arg0, Object arg1 ...)
```

> Note: For other function signatures, visit [MDSN](https://docs.microsoft.com/en-us/dotnet/api/)

Don't worry about what the keywords `Public` or `Shared` mean for now, they will be covered in a later Chapter.

I'm going to show you an example of what this subroutine can do:

```vb
'                    Placeholder ↓      ↓ arg0
Console.WriteLine("You guessed: {0}", guess)
```

The String we previously used has been modified, we can now see curly brackets and a number inside of them. This acts as a marker for where an argument should go. The number inside of these brackets indicate which argument should be used there.

In our case above, argument **0** is the variable `guess`.
Therefore, the marker for argument **0** will be replaced with the value of `guess`.

Assuming `guess = "34"`, the output of this line of code will be:

```vb
You guessed: 34
```

---

### Generating a random number

Now that we know how to store variable and how to print variables, we can continue making our guessing game!

```vb
Module Program

    Sub Main()
        Console.WriteLine("Guess the number!")

        Dim rng As New Random()

        Dim secret_number = rng.Next(1, 101)

        Console.WriteLine("Please input your guess.")

        'Infers type from return value of "ReadLine()"
        Dim guess = Console.ReadLine() 

        Console.WriteLine("You guessed: {0}", guess)
    End Sub

End Module
```

Notice, we have added two new lines to our program.

```vb
Dim rng As New Random()
```

Firstly, we have to create a `New Object` called `Random`. When instructed to, the variable `rng` will create [Pseudorandom numbers](https://en.wikipedia.org/wiki/Pseudorandom_number_generator).

> Data can never truly be random, but Pseudorandom number generators come pretty close.

We could also write this line as:
```vb
Dim rng As Random = New Random()
```
However, this is much longer and does exactly the same thing. The `New` keyword `constructs` a new object. Don't worry about this for now as it will be covered in more detail in a later chapter.

From this new object we access many functions. We use `Random.Next()` in the line:

```vb
'                       Min  ↓   ↓ Max
Dim secret_number = rng.Next(1, 101)
```

This line assigns the variable `secret_number` to a random value in the range 1 to 101 returned by the `Next()` function.

You may be slightly confused as to why we have `101` as our maximum value. This is because the number generated is:
* Greater or Equal to `min`
* Less than `max`

Therefore `max = 101` so the function could possibly return 100 as it meets both conditions.

---

### Comparing Guess to the Secret Number

Now that we have taken user input and created a random secret number, we need to compare the two values.

To do this we use an `If Statement`. An `If Statement` is an example of "Selection" or "Flow Control".

```vb
If guess = secret_number Then
    Console.WriteLine("You win!")
End If
```
An `If Statement` checks whether a value is either `True` or `False`.

`If, Else and ElseIf` can be used for an `If Statement`, here is an example:

```vb
If 6 = 1 Then
    'Not true, 6 is not equal to 1
    'Go to the next check
ElseIf ":)" = ":(" Then
    'Not true either, these two strings aren't equal
    'Go to the next check
Else
    'Nothing else is true, so run this code
End If
```

Undestanding this, we can use an `If Statement` to compare the user's input and our secret number.

```vb
If guess = secret_number Then
    Console.WriteLine("You win!")
ElseIf guess > secret_number Then
    Console.WriteLine("Too big!")
ElseIf guess < secret_number Then
    Console.WriteLine("Too small!")
End If
```

We can also use another type of `Selection` called `Switch` or `Case` selection. `Case` selection in Visual Basic looks like this:

```vb
Dim number = 1

Select Case number
    Case 1
        'Code here is run, because number = 1
    Case 3

    Case Else

End Select
```

However, a case block is not needed in our program, but it's still useful for when you have a lot of conditions to check.

---

### Looping

One final addition to our code is needed. After the user has guessed once, the program ends. We don't want this. Instead, we want the program to keep asking the user for guesses until they get the right answer.

The easiest way to implement this is with a `While` Loop. Basically, a `While` loop keeps running a block of code whilst a condition is met. Simple right.

Here's an example:
```vb
Dim i As Integer = 0

While i < 2
    'Do Something
End While
```

Whilst the variable `i` is less than 2, it will "do something".

We can adapt this to make our own program loop:
```vb
While True

    Dim guess = Console.ReadLine()

    If guess = "quit" Then
        Exit While
    End If

    'Compare guess here
End While
```

Ok, let's analyse the new lines one by one.
Firstly, the line `While True` should run forever, this is because the While loop is checking a conditional, this conditional is always `True` and therefore will keep looping until the end of time... (Probably).

To stop the loop going on forever, we have an `If Statement` to check if the user inputted `"quit"`, if they did we `Exit` the `While` loop. Pretty nifty.

---

**WOW**, you've survived so far to create your first program. Here is the full code in case you couldn't put it all together.

```vb
Module Program

    Sub Main()

        Console.WriteLine("Guess the number!")

        Dim rng As New Random()

        Dim secret_number = rng.Next(1, 101)

        While True

            Console.WriteLine("Please input your guess.")

            Dim guess = Console.ReadLine()

            If guess = "quit" Then
                Exit While
            End If

            If guess = secret_number Then
                Console.WriteLine("You win!")
                Return
            ElseIf guess > secret_number Then
                Console.WriteLine("Too big!")
            ElseIf guess < secret_number Then
                Console.WriteLine("Too small!")
            End If

        End While

    End Sub

End Module
```

Remember to run your project press `Control + F5`.

> Note: I added a `Return` on line 23, so when you win, the program skips to the end of `Sub Main`, thus ending the program!
