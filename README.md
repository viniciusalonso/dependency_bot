# DependencyBot

Dependency bot is designed to help to keep our dependencies up-to-dated! We use gem like bundle_audit to verify your Gemfile.lock and generete merge requests in Gitlab automating this responsability.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add dependency_bot
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install dependency_bot
```

## Usage

### Local

You can just run the binary `dependency_bot` in our project and it will update the Gemfile.lock if necessary, commit in a new branch, push and create a merge request.

### Gitlab CI

You can add this gem for your `.gitlab-ci.yml`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dependency_bot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/dependency_bot/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DependencyBot project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/dependency_bot/blob/main/CODE_OF_CONDUCT.md).
