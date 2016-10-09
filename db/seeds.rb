# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# ruby encoding: utf-8

def create_or_update_catalog(catalog_attrs)
  catalog = Catalog.find_by(name: catalog_attrs[:name])
  if catalog.nil?
    catalog = Catalog.create!(catalog_attrs)
    puts ">>>> Создан новый каталог: #{catalog_attrs[:name]}"
  elsif catalog.attributes == catalog_attrs
    puts "Существующий каталог не изменен: #{catalog_attrs[:name]}"
  else
    catalog.update_attributes(catalog_attrs)
    puts "Обновлен существующий << Каталог >>: #{catalog_attrs[:name]}"
  end
  catalog
end

def create_or_update_category(category_attrs)
  category = Category.find_by(name: category_attrs[:name], catalog: category_attrs[:catalog])
  if category.nil?
    category = Category.create!(category_attrs)
    puts ">>>> Создана новая Категория: #{category_attrs[:name]}"
  elsif category.attributes == category_attrs
    puts "Существующая Категория не изменена: #{category_attrs[:name]}"
  else
    category.update_attributes(category_attrs)
    puts "Обновлена существующая Категория: #{category_attrs[:name]}"
  end
  category
end


catalog = create_or_update_catalog(
  name: 'Лекарства',
  slug: 'lekarstva'
)

category = create_or_update_category(
  name: 'Антибиотики',
  slug: 'antibiotiki',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Ушные Капли',
  slug: 'Ushnie_kapli',
  catalog: catalog
)


catalog = create_or_update_catalog(
  name: 'Красота',
  slug: 'beauty'
)

category = create_or_update_category(
  name: 'Аромотерапия',
  slug: 'aromoterapia',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Женская Гигиена',
  slug: 'jenskaea_gigiena',
  catalog: catalog
)



catalog = create_or_update_catalog(
  name: 'Витамины и БАДы',
  slug: 'vitaminy_i_bady'
)

category = create_or_update_category(
  name: 'Биологически активные добавки',
  slug: 'biologicheski_aktivnye_dobavki',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Витамины',
  slug: 'vitaminy',
  catalog: catalog
)



catalog = create_or_update_catalog(
  name: 'Мед. приборы и изделия',
  slug: 'med_pribory_i_izdeliya'
)

category = create_or_update_category(
  name: 'Диагностические средства',
  slug: 'diagnosticheskie_sredstva',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Изделия медицинского назначения',
  slug: 'izdeliya_meditsinskogo_naznacheniya',
  catalog: catalog
)


catalog = create_or_update_catalog(
  name: 'Спорт и фитнесс',
  slug: 'sport_i_fitness'
)

category = create_or_update_category(
  name: 'Аксессуары',
  slug: 'aksessuary',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Спортивное питание',
  slug: 'sportivnoe_pitanie',
  catalog: catalog
)


catalog = create_or_update_catalog(
  name: 'Мама и малыш',
  slug: 'mama_i_malish'
)

category = create_or_update_category(
  name: 'Гигиена и уход',
  slug: 'gigiena_i_uhod',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Детсткая одежда',
  slug: 'detskaea_odejda',
  catalog: catalog
)


catalog = create_or_update_catalog(
  name: 'REN',
  slug: 'ren'
)

category = create_or_update_category(
  name: 'Маски',
  slug: 'maski',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Очищение',
  slug: 'ocishenie',
  catalog: catalog
)


catalog = create_or_update_catalog(
  name: 'Секс',
  slug: 'sex'
)

category = create_or_update_category(
  name: 'Презервативы',
  slug: 'condomns',
  catalog: catalog
)

category = create_or_update_category(
  name: 'Интимные товары',
  slug: 'intimnie_tovari',
  catalog: catalog
)
