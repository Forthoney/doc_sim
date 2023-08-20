# Doc Sim - Efficient algorithm for calculating approximate document similarity

A Ruby implementation of [Mining of Massive Datasets](http://www.mmds.org/)'s document similarity algorithm. It uses Minhash and Localitiy Sensitive Hashing to efficiently find documents with a high probability of being similar.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add doc_sim

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install doc_sim

## Usage

1. Shingle your documents using `Shingling.shingle` (k-shingling). The optimal k value differs based on the type of argument, but 5 is a good first guess.
2. Initialize a `Minhash::Minhash`.
3. Use the `Minhash.signature` to get the signature array for each document.
4. Initialize a `LocalitySensitiveHashing::LocalitySensitiveHashing` with appropriate band and row length, depending on your desired precision and recall.
5. `insert` each signaturea array with its index into the LSH
6. Take all potentially similar pairs (candiate pairs) from the LSH
7. (Optional) Rigorously calculate the similarity between the candidate pairs. This will need to be done manually.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Forthoney/document_similarity. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/Forthoney/document_similarity/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LocalitySensitiveHashing project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Forthoney/document_similarity/blob/main/CODE_OF_CONDUCT.md).
