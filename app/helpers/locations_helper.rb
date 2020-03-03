module LocationsHelper
    def location_types
        [
            ["bar"],
            ["storage"],
            ["compound"],
            ["truck"]
        ]
    end

    def location_avatar(type)
        case type
        when 'bar'
            return 'https://cdn4.iconfinder.com/data/icons/food-164/64/wine-drink-luxury-alcohol-bottles-beverage-512.png'
        when 'storage'
            return 'https://cdn2.iconfinder.com/data/icons/seo-and-marketing-line-5/32/100-512.png'
        when 'compound'
            return 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSJ81v7KinpZwPfLAmPDeUdRprJFbk2MCwn3b4gf79w6C8QMZai'
        when 'truck'
            return 'https://icons-for-free.com/iconfiles/png/512/shipping+store+truck+icon-1320166084459861055.png'
        end
    end
end
