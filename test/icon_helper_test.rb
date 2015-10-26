require 'test_helper'

class StrokeSeven::Rails::IconHelperTest < ActionView::TestCase

  test "#s7_icon with no args should render an album icon" do
    assert_icon i("pe-s7-album")
  end

  test "#s7_icon should render different individual icons" do
    assert_icon i("pe-s7-album"),       "album"
    assert_icon i("pe-s7-female"),      "female"
    assert_icon i("pe-s7-magic-wand"),  "magic-wand"
  end

  test "#s7_icon should incorporate additional class styles" do
    assert_icon i("pe-s7-album pull-right"),         "album", :class => "pull-right"
    assert_icon i("pe-s7-album pull-right success"), "album", :class => "pull-right success"
  end

  test "#s7_icon should incorporate a text suffix" do
    assert_icon "#{i("pe-s7-female")} Take a photo", "female", :text => "Take a photo"
  end

  test "#s7_icon should html escape text" do
    assert_icon "#{i("pe-s7-female")} &lt;script&gt;&lt;/script&gt;", "female", :text => "<script></script>"
  end

  test "#s7_icon should not html escape safe text" do
    assert_icon "#{i("pe-s7-female")} <script></script>", "female", :text => "<script></script>".html_safe
  end

  test "#s7_icon should pull it all together" do
    assert_icon "#{i("pe-s7-female pull-right")} Take a photo", "female", :text => "Take a photo", :class => "pull-right"
  end

  test "#s7_icon should pass all other options through" do
    assert_icon %(<i class="pe-s7-male" data-id="123"></i>), "male", :data => { :id => 123 }
  end

  private

  def assert_icon(expected, *args)
    message = "`s7_icon(#{args.inspect[1...-1]})` should return `#{expected}`"
    assert_dom_equal expected, s7_icon(*args), message
  end

  def i(classes)
    %(<i class="#{classes}"></i>)
  end
end
