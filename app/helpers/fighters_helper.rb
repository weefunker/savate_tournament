module FightersHelper
    def height
        (121..244).to_a.collect{|k| ["#{Height.new(k).to_s(:default, :metric)}","#{Height.new(k).to_s(:default, :imperial)}","#{Height.new(k).feet}"]}
    end
end
