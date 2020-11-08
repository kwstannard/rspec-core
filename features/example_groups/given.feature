Feature: given
  `given` is a way to one-line context and scenario at the same time.

  Scenario: A spec adding ints
    Given a file named "simple_ruby_spec.rb" with:
    """ruby
    RSpec.describe "adding a and b" do
      subject { a + b }

      given(a: 1, b: 2).it { is_expected.to eq(3) }
      given(a: 2, b: 3).it { is_expected.to eq(5) }
      given(a: 3, b: 3).it { is_expected.to eq(6) }
    end
    """

    When I run `rspec simple_ruby_spec.rb -fdoc`
    Then the output should contain:
    """

    adding a and b
      when a is 1 and b is 2
        is expected to eq 3
      when a is 2 and b is 3
        is expected to eq 5
      when a is 3 and b is 3
        is expected to eq 6
    """

  Scenario: A spec adding strings
    Given a file named "simple_ruby_spec.rb" with:
    """ruby
    RSpec.describe "adding string a and string b" do
      subject { a + b }

      given(a: "1", b: "2").it { is_expected.to eq("12") }
      given(a: "2", b: "3").it { is_expected.to eq("23") }
      given(a: "3", b: "3").it { is_expected.to eq("33") }
    end
    """

    When I run `rspec simple_ruby_spec.rb -fdoc`
    Then the output should contain:
    """

    adding string a and string b
      when a is "1" and b is "2"
        is expected to eq "12"
      when a is "2" and b is "3"
        is expected to eq "23"
      when a is "3" and b is "3"
        is expected to eq "33"
    """
