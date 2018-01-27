# About 

BP task challenge of four small parts. 

## Requirements
- MySQL
- Python 3.6

## Parts

### Parts 1&2

1. Loading test data
```bash
mysql -u username -p database_name < part[1,2]/test_part[1,2]_dump.sql
```
2. Running a query
```bash
mysql> source part[1,2]/query.sql
```

### Part 3
1. Running the solution
```bash
    python3 main.py -f inputs/[0,1].txt
```

### Part 4
1. Running the recursive solution
```bash
    python3 recursive_sort_out_solution.py -n 3
```
2. Running the loop based solution
```bash
    python3 loop_base_solution.py -n 3
```
