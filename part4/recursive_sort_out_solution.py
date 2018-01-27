from optparse import OptionParser
import itertools


def solve():
    """
        Main function to wrap the algorithm to solve the task
    """
    number = get_input_number()

    combos = [triple for triple in list(generate_combos(number)) if is_triple_beautiful(number, triple)]
    sets = [subset for subset in generate_sets_combination(combos) if is_set_beautiful(subset)]

    result = filter_longest_set(sets)

    print(len(result))
    for row in result:
        print(row[0], row[1], row[2])


def generate_combos(number):
    return itertools.permutations(range(number), 3)


def generate_sets_combination(combos):
    """
        Generate all possible set combinations using triple combinations
    """
    subsets = []

    for x in range(0, len(combos) + 1):
        for subset in itertools.combinations(combos, x):
            if is_set_beautiful(subset):
                subsets.append(subset)

    return subsets


def filter_longest_set(sets):
    """
        Filter the longest one from a list of sets
    """
    sets = sorted(sets, key=len)

    return sets[len(sets) - 1]


def is_triple_beautiful(number, triple):
    """
        Find if a triple is beautiful. Conditions to match: x,y,z > 0
        and x+y+z=number
    """
    if len([integer for integer in list(triple) if integer <= 0]) > 1:
        return False

    if sum(triple) != number:
        return False

    return True


def is_set_beautiful(items):
    """
        Find if a set is beautiful. Conditions to match: X,Y,Z are all unique
    """
    x_set = []
    y_set = []
    z_set = []

    for triple in items:
        (x, y, z) = triple
        x_set.append(x)
        y_set.append(y)
        z_set.append(z)

    for subset in [x_set, y_set, z_set]:
        if not are_all_unique(subset):
            return False

    return True


def are_all_unique(items):
    """
        Find if all items are in unique in a list
    """
    seen = set()

    return not any(i in seen or seen.add(i) for i in items)


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
