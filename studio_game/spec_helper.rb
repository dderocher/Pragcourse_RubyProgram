
require 'rspec'

=begin
Conﬁguring RSpec with spec_helper.rb
The conventon for conﬁguring RSpec is a ﬁle named 
spec_helper.rb in your spec directory. It's always in your 
load path, so you require 'spec_helper' in each ﬁle.
This is the perfect place to enable coloured output, 
randomise the order that specs are run in, and apply 
formaters as appropriate.
=end

=begin
--------------------------
Enable should Syntax
--------------------------
To enable the traditional should syntax, create a file named spec_helper.rb in your project 
directory and paste the following code into it:

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
  config.mock_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

This enables both the use of the traditional should syntax, as well as the newer expect syntax.

Then, at the top of your *_spec.rb file, add the following line which loads your spec_helper.rb file:

require_relative 'spec_helper'
You should then be able to run your specs and not see any deprecation warnings. :-)
=end

#----------------------------------------------------------------------------
#----------------------------------------------------------------------------



RSpec.configure do |config|

  #config.color_enabled = true
  config.color = true
  #config.order = "random"
  #config.formatter = 'NyanCatWideFormatter'
end
