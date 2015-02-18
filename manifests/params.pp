# Global veritas parameters


class veritas::params {
  $version = '6.2'
  $version_condensed=inline_template('<%= @version.gsub(/[^0-9a-z ]/i, "") %>')
}
