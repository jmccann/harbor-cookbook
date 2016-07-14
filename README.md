# harbor

Try to automate configuration and install of [harbor](https://vmware.github.io/harbor/).

## Supported Platforms

Tested And Validated On
- Ubuntu 16.04

## Usage

You can drive the configuration through `node['harbor']['config']` attributes matching keys in the harbor.cfg file.

### harbor::default

Include `harbor` in your run_list.

```json
{
  "run_list": [
    "recipe[harbor::default]"
  ]
}
```

## Testing

* Linting - Rubocop and Foodcritic
* Spec - ChefSpec
* Integration - Test Kitchen

Testing requires [ChefDK](https://downloads.chef.io/chef-dk/) be installed using it's native gems.

```
foodcritic -f any -X spec .
rubocop
rspec --color --format progress
```

If you run into issues testing please first remove any additional gems you may
have installed into your ChefDK environment.  Extra gems can be found and removed
at `~/.chefdk/gem`.

## License and Authors

Author:: Jacob McCann (<jacob.mccann2@target.com>)

```text
Copyright (c) 2016 Jacob McCann, All Rights Reserved.
```
