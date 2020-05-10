# Slim - FanC Syntax Analyzer

## Usage

```bash
# Library Dir
cd Lib

# Build parser
make all

# Input FanC program
parser < input.in > output.out
```

## Testing

Use `Test/in` folder for input files and `Test/res` for expecting results.

```bash
# Run Tests
./Tests/runTests.sh
```

## Example

Input FanC program to be analyzed:

```java
// Skip comment
void printOk(bool isOk) {
    if (isOk) print("ok");
}

void main()
{
    int x = 4;
    byte y = 100 b;
    printOk(x>y);
    int z;
}
```

Outputs:

```text
6: RetType ->  VOID
33: Type -> BOOL
11: FormalDecl -> Type ID
9: FormalsList -> FormalDecl
8: Formals -> FormalsList
36: Exp -> ID
40: Exp -> STRING
29: ExpList -> Exp
27: Call -> ID LPAREN ExpList RPAREN
18: Statement -> Call SC
21: Statement -> IF LPAREN Exp RPAREN Statement
12: Statements -> Statement
4: FuncDecl -> RetType ID LPAREN Formals RPAREN LBRACE Statements RBRACE
6: RetType ->  VOID
7: Formals -> epsilon
31: Type -> INT
38: Exp -> NUM
16: Statement -> Type ID ASSIGN Exp SC
12: Statements -> Statement
32: Type -> BYTE
39: Exp -> NUM B
16: Statement -> Type ID ASSIGN Exp SC
13: Statements -> Statements Statement
36: Exp -> ID
36: Exp -> ID
46: Exp -> Exp RELOP Exp
29: ExpList -> Exp
27: Call -> ID LPAREN ExpList RPAREN
18: Statement -> Call SC
13: Statements -> Statements Statement
31: Type -> INT
15: Statement -> Type ID SC
13: Statements -> Statements Statement
4: FuncDecl -> RetType ID LPAREN Formals RPAREN LBRACE Statements RBRACE
2: Funcs -> epsilon
3: Funcs -> FuncDecl Funcs
3: Funcs -> FuncDecl Funcs
1: Program -> Funcs
```
