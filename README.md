```
 _               _                      _      
| |             | |                    | |     
| |__   __ _ ___| |__         ___ __ _| | ___ 
| '_ \ / _` / __| '_ \       / __/ _` | |/ __|
| |_) | (_| \__ \ | | |  _  | (_| (_| | | (__ 
|_.__/ \__,_|___/_| |_| (_)  \___\__,_|_|\___|
```

# bash-calculator

A simple command-line calculator written in Bash. Supports addition, subtraction, multiplication, and division of two values.

## Usage

```bash
./math.bash -[asmd] val1 val2
```

### Options

| Flag | Operation      |
|------|----------------|
| `-a` | Addition       |
| `-s` | Subtraction    |
| `-m` | Multiplication |
| `-d` | Division       |

### Examples

```bash
./math.bash -a 10 5    # 15
./math.bash -s 10 5    # 5
./math.bash -m 10 5    # 50
./math.bash -d 10 5    # 2.00
```

> Division results are formatted to two decimal places. Dividing by zero exits with status `1`.

## Running Tests

```bash
chmod +x math.bash test_math.bash
./test_math.bash
```

The test suite covers addition, subtraction, multiplication, division (including divide-by-zero), and invalid option handling.

## Author

Alejandro Alvarado
