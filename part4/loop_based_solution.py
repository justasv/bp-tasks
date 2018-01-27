import pandas as pd
from optparse import OptionParser


def solve():
    """
        Main function to wrap the algorithm to solve the task
    """
    number = get_input_number()

    triple_set = loop_generate_set(number)

    print(len(triple_set))
    for i in range(len(triple_set)):
        print(' '.join(str(x) for x in triple_set[i]))


def loop_generate_set(number):
    """
        Generate a set of triples
    """
    triple_set = []
    columns = pd.DataFrame(columns=['x1', 'y1', 'z1'])

    for i in range(number):
        for j in range(number):
            z = number - i - j
            if i != z and i != j and j != z and z >= 0:
                if not (i in columns['x1'].unique()):
                    if not (j in columns['y1'].unique()):
                        if not (z in columns['z1'].unique()):
                            triple_set.append([i, j, z])
                            columns.loc[len(columns)] = [i, j, z]

    return triple_set


def get_input_number():
    """
        Get filename of an input file as an option
    """
    parser = OptionParser()
    parser.add_option("-n", "--number", dest="number")

    (options, args) = parser.parse_args()
    if options.number:
        try:
            n = int(options.number)

            if n < 0 or n > 300:
                raise Exception('n should be > 0 and < 300')
        except ValueError:
            raise Exception('Number should be an integer')
        return n

    raise Exception('Option "number" is mandatory')


if __name__ == '__main__':
    try:
        solve()
    except Exception as e:
        print('Validation error: ' + e.args[0])
