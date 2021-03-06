#!/usr/bin/env ruby -wW2
# encoding: UTF-8

$: << File.dirname(__FILE__)
require 'odisk_test_helpers'

require 'oj'

class ODiskTest < ::Test::Unit::TestCase

  def test_odisk_download
    create_top_dir()
    `rm -rf #{$remote_top}`
    #Net::SSH.start(remote.host, remote.user) { |ssh| ssh.exec!("rm -rf #{$remote_top}") }

    out = run_odisk('-s')
    if $debug
      puts out
    else
      assert_equal('', out)
    end
    # now create a new local and verify the new and old are the same
    top2 = ::File.join($local_dir, 'top2')
    `rm -rf "#{top2}"`

    out = run_odisk('-s', top2)
    if $debug
      puts out
    else
      assert_equal('', out)
    end
    diffs = ::ODisk::Diff.dir_diff($local_top, top2, true)
    #puts "*** diffs: #{diffs.values.join('')}"
    assert_equal({}, diffs)
  end

end # ODiskTest
