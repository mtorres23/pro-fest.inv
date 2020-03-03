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
            return 'https://i.ya-webdesign.com/images/baseball-plate-png-10.png'
        when 'truck'
            return 'https://icons-for-free.com/iconfiles/png/512/shipping+store+truck+icon-1320166084459861055.png'
        end
    end

    def location_menu_button(option)
        case option
        when 'Inventory'
            return "https://cdn3.iconfinder.com/data/icons/food-technology-2/64/Shelves_Food-shelving-supermarket-drink-512.png"
        when "Staff"
            return 'https://cdn.iconscout.com/icon/premium/png-256-thumb/staff-9-559919.png'
        when "Orders"
            return 'https://lh3.googleusercontent.com/proxy/bPBsVsLdZGZt2ZZl-OW3IKopdrf9qka9rl_LyDPn7FxXNL1MyaJRH-VHTof9mKk2Hyma2uooDNuIzjwI8O1N9BsyxXQoyWemKwHw6a11bvogmtzLrl0yhgUcNDUZ0ppnxSoCrfPVpW8q'
        end
    end
end
