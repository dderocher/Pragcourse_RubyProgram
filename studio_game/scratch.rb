# require 'tk'
#
# root = TkRoot.new { title "Hello, World!" }
# TkLabel.new(root) do
#   text 'Hello, World!'
#   pack { padx 15 ; pady 15; side 'left' }
# end
# Tk.mainloop


require 'tk'

class PigBox
  def pig(word)
    leadingCap = word =~ /^A-Z/
    word.downcase!
    res = case word
            when /^aeiouy/
              word+"way"
            when /^([^aeiouy]+)(.*)/
              $2+$1+"ay"
            else
              word
          end
    leadingCap ? res.capitalize : res
  end

  def showPig
    @text.value = @text.value.split.collect{|w| pig(w)}.join(" ")
  end

  def initialize
    ph = { 'padx' => 500, 'pady' => 50 }     # common options
    p = proc {showPig}

    @text = TkVariable.new
    root = TkRoot.new { title "Pig" }
    top = TkFrame.new(root)
    TkLabel.new(top) {text    'Enter Text:' ; pack(ph) }
    @entry = TkEntry.new(top, 'textvariable' => @text)
    @entry.pack(ph)
    TkButton.new(top) {text 'Pig It'; command p; pack ph}
    TkButton.new(top) {text 'Exit'; command {proc exit}; pack ph}
    top.pack('fill'=>'both', 'side' =>'top')
  end
end

PigBox.new
Tk.mainloop