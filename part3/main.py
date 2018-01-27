from optparse import OptionParser


def solve():
    """
        Main function to wrap the algorithm to solve the task
    """
    filename = get_filename()
    if not filename:
        raise Exception('Input file not defined')

    (n, word) = load_file(filename)

    rotations = generate_rotations(word)

    for rotation in rotations:
        substrings = find_all_substrings(rotation)
        palindromes = filter_palindromic_words(substrings)
        print(len(filter_longest_word(palindromes)))


def generate_rotations(word):
    """
        Generate k-length rotations list.
        Rotations is defined as cutting the first k characters from the beginning of the word
        and appending them to the end.
    """
    rotations = []

    length = len(word)
    for i in range(0, length):
        rotations.append(word[i:length] + word[0:i])

    return rotations


def find_all_substrings(word):
    """
        Return all possible substrings for a given word
    """
    length = len(word)

    return [word[i:j + 1] for i in range(length) for j in range(i, length)]


def filter_palindromic_words(words):
    """
        Filter a list of words that are palindromic
    """
    return [word for word in words if is_word_palindromic(word)]


def filter_longest_word(words):
    """
        Filter a longest one from a list of words
    """
    words = sorted(words, key=len)

    return words[len(words) - 1]


def is_word_palindromic(word):
    """
        Check if given is palindromic or not
    """
    for i, char in enumerate(word):
        if char != word[-i - 1]:
            return False
    return True


def load_file(filename):
    """
        Load, parse input file and return a tuple of integer N and a string
    """
    file = open(filename, 'r')
    lines = file.readlines()

    if len(lines) != 2:
        raise Exception('Input file should have a least two values')

    n = lines[0].strip()
    word = lines[1].strip()

    try:
        n = int(n)
    except ValueError:
        raise Exception('N should be an integer')

    return n, word


def get_filename():
    """
        Get filename of an input file as an option
    """
    parser = OptionParser()
    parser.add_option("-f", "--file", dest="filename")

    (options, args) = parser.parse_args()
    if options.filename:
        return options.filename

    return None


if __name__ == '__main__':
    try:
        solve()
    except Exception as e:
        print('Validation error: ' + e.args[0])
