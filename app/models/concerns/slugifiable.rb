class Slugifiable
    CODEBOOK = {
        "$" => "S",
        "(" => "",
        ")" => "",
        "." => "",
        "&" => "and",
        " " => "-",
        '"' => "",
        "'" => "",
        "+" => "plus"
    }

    def self.slugify(string)
        string.gsub(/\W/,CODEBOOK).downcase
    end
end