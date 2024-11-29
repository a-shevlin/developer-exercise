class Exercise

  # Assume that "str" is a sequence of words separated by spaces.
  # Return a string in which every word in "str" that exceeds 4 characters is replaced with "marklar".
  # If the word being replaced has a capital first letter, it should instead be replaced with "Marklar".
  def self.marklar(str)
    # split "str" into array
    str.split.map do |word|

      # store punctuation
      punctuation = word[-1] =~ /[[:punct:]]/ ? word[-1] : ''
      base_word = punctuation.empty? ? word : word[0...-1]
      
      # check if word is longer than 4 characters
      if base_word.length > 4
        replacement = base_word[0] =~ /[A-Z]/ ? "Marklar" : "marklar"
        "#{replacement}#{punctuation}"
      else
        word
      end
    end.join(' ')
  end

  # Return the sum of all even numbers in the Fibonacci sequence, up to
  # the "nth" term in the sequence
  # eg. the Fibonacci sequence up to 6 terms is (1, 1, 2, 3, 5, 8),
  # and the sum of its even numbers is (2 + 8) = 10
  def self.even_fibonacci(nth)
    return 0 if nth < 1

    fib = []

    # generate sequence for each term from 1 to the "nth"
    (1..nth).each { |i| fib << fib_recursive(i) }
    # retrieve sum of only even numbers in sequence
    fib.select { |num| num.even? }.sum
  end

  # recursive method to compute Fibonacci sequence
  def self.fib_recursive(n)
    return n if n <= 1
    fib_recursive(n - 1) + fib_recursive(n - 2)
  end
end