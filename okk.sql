
-- НОВАЯ СХЕМА TARIFF
CREATE schema tariff 

CREATE TABLE tariff.accesses (
id SERIAL PRIMARY KEY,
title VARCHAR(50),
tariff_id SMALLINT,
obj_id SMALLINT,
action_id SMALLINT,
period INTEGER,
value INTEGER
);
COMMENT ON TABLE tariff.accesses IS 'доступные действия, согласно тарифу';
COMMENT ON COLUMN tariff.accesses.title IS 'Заголовок действия';
COMMENT ON COLUMN tariff.accesses.obj_id IS 'id объекта';
COMMENT ON COLUMN tariff.accesses.action_id IS 'id действия';
COMMENT ON COLUMN tariff.accesses.period IS 'период действия доступа в днях';
COMMENT ON COLUMN tariff.accesses.value IS 'значение доступного действия (Например количество подключенных устройств)';
CREATE INDEX index_accesses_id ON tariff.accesses USING BTREE (id);
CREATE INDEX index_accesses_tariff_id ON tariff.accesses USING BTREE (tariff_id);
CREATE INDEX index_accesses_obj_id ON tariff.accesses USING BTREE (obj_id);
CREATE INDEX index_accesses_action_id ON tariff.accesses USING BTREE (action_id);



CREATE TABLE tariff.tariffs (
id smallserial,
name varchar(50),
date_create timestamp with time zone,
date_mod timestamp with time zone,
date_start timestamp with time zone,
status smallint,
description varchar(100)
);
COMMENT ON TABLE tariff.tariffs IS 'существующие тарифы';
COMMENT ON COLUMN tariff.tariffs.name IS 'название тарифа';
COMMENT ON COLUMN tariff.tariffs.date_create IS 'дата создания тарифа';
COMMENT ON COLUMN tariff.tariffs.date_mod IS 'дата изменения тарифа';
COMMENT ON COLUMN tariff.tariffs.date_start IS 'дата начала действия тарифа';
COMMENT ON COLUMN tariff.tariffs.status IS 'статус тарифа';
COMMENT ON COLUMN tariff.tariffs.description IS 'описание тарифа';
CREATE INDEX index_tariffs_id ON tariff.tariffs USING BTREE (id);



CREATE TABLE tariff.objects (
    id smallserial,
    name character varying(50),
    description character varying(100)
);
COMMENT ON TABLE tariff.objects IS 'объекты';
COMMENT ON COLUMN tariff.objects.name IS 'название объекта';
COMMENT ON COLUMN tariff.objects.description IS 'описание';
CREATE INDEX index_objects_id ON tariff.objects USING BTREE (id);



CREATE TABLE tariff.actions (
    id smallserial,
    name character varying(50),
    description character varying(100)
);
COMMENT ON TABLE tariff.actions IS 'действия';
COMMENT ON COLUMN tariff.actions.name IS 'название действия';
COMMENT ON COLUMN tariff.actions.description IS 'описание';
CREATE INDEX index_actions_id ON tariff.actions USING BTREE (id);

CREATE TABLE tariff.prices (
    tariff_id smallserial,
    opal_type smallint,
    date_create timestamp with time zone,
    date_mod timestamp with time zone,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    status smallint,
    price smallint,
    price_monер smallint
);
COMMENT ON TABLE tariff.prices IS 'цены тарифов';
COMMENT ON COLUMN tariff.prices.opal_type IS 'тип оплаты ';
COMMENT ON COLUMN tariff.prices.date_create IS 'дата создания цены';
COMMENT ON COLUMN tariff.prices.date_mod IS 'дата изменения цены';
COMMENT ON COLUMN tariff.prices.date_start IS 'дата начала действия цены';
COMMENT ON COLUMN tariff.prices.date_end IS 'дата конца действия цены';
COMMENT ON COLUMN tariff.prices.status IS 'статус цены';
COMMENT ON COLUMN tariff.prices.price IS 'цена ';
COMMENT ON COLUMN tariff.prices.price_monер IS 'цена за месяц';
CREATE INDEX index_prices_tariff_id ON tariff.prices USING BTREE (tariff_id);



CREATE TABLE tariff.toc_tarrif_user_price (
    user_id integer,
    tariff_id smallint,
    opal_type smallint,
    day_of_payment timestamp with time zone,
    status smallint
);
COMMENT ON TABLE tariff.toc_tarrif_user_price IS 'действия';
COMMENT ON COLUMN tariff.toc_tarrif_user_price.day_of_payment IS 'день оплаты по тарифу';
COMMENT ON COLUMN tariff.toc_tarrif_user_price.status IS 'статус подключения';
CREATE INDEX index_toc_tarrif_user_price_user_id ON tariff.toc_tarrif_user_price USING BTREE (user_id);
CREATE INDEX index_toc_tarrif_user_price_tariff_id ON tariff.toc_tarrif_user_price USING BTREE (tariff_id);

CREATE TABLE tariff.opal_type (
id smallserial,
name character varying(50), 
description character varying(100) 
);
COMMENT ON TABLE tariff.opal_type IS 'тип оплаты';
COMMENT ON COLUMN tariff.opal_type.name IS 'название действия';
COMMENT ON COLUMN tariff.opal_type.description IS 'описание';
CREATE INDEX index_opal_type_id ON tariff.opal_type USING BTREE (id);

-- НОВАЯ СХЕМА ROLES

CREATE schema roles

CREATE TABLE roles.rights (
id serial,
obj_id integer,
action_id integer, 
name character varying(50), 
description character varying(100)

);
COMMENT ON TABLE roles.rights IS 'права';
COMMENT ON COLUMN roles.rights.obj_id IS 'id объекта';
COMMENT ON COLUMN roles.rights.action_id IS 'id действия';
COMMENT ON COLUMN roles.rights.name IS 'название прав';
COMMENT ON COLUMN roles.rights.description IS 'описание права';
CREATE INDEX index_rights_id ON roles.rights USING BTREE (id);
CREATE INDEX index_rights_obj_id ON roles.rights USING BTREE (obj_id);
CREATE INDEX index_rights_action_id ON roles.rights USING BTREE (action_id);


CREATE TABLE roles.roles (
id serial,
name varchar(50), 
description varchar(100)
);
COMMENT ON TABLE roles.roles IS 'роли';
COMMENT ON COLUMN roles.roles.name IS 'название роли';
COMMENT ON COLUMN roles.roles.description IS 'описание роли';
CREATE INDEX index_roles_id ON roles.roles USING BTREE (id);



CREATE TABLE roles.objects (
id serial,
name varchar(50),
description varchar(100)
);
COMMENT ON TABLE roles.objects IS 'объекты';
COMMENT ON COLUMN roles.objects.name IS 'название объекта';
COMMENT ON COLUMN roles.objects.description IS 'описание';
CREATE INDEX index_objects_id ON roles.objects USING BTREE (id);



CREATE TABLE roles.actions (
id serial,
name varchar(50),
description varchar(100)
);
COMMENT ON TABLE roles.actions IS 'действия';
COMMENT ON COLUMN roles.actions.name IS 'название действия';
COMMENT ON COLUMN roles.actions.description IS 'описание';
CREATE INDEX index_actions_id ON roles.actions USING BTREE (id);



--НОВАЯ СХЕМА SOURSE

CREATE schema sourse

CREATE TABLE sourse.html_pages (
id smallserial,
name character varying(50),
date_create timestamp with time zone, 
date_mod timestamp with time zone, 
user_mod integer, 
user_create integer, 
description character varying(100), 
html text 
);
COMMENT ON TABLE sourse.html_pages IS 'html страницы';
COMMENT ON COLUMN sourse.html_pages.name IS 'название страницы';
COMMENT ON COLUMN sourse.html_pages.date_create IS 'дата создания ';
COMMENT ON COLUMN sourse.html_pages.date_mod IS 'дата изменения ';
COMMENT ON COLUMN sourse.html_pages.user_mod IS 'кто изменил';
COMMENT ON COLUMN sourse.html_pages.user_create IS 'кто создал';
COMMENT ON COLUMN sourse.html_pages.description IS 'описание ';
COMMENT ON COLUMN sourse.html_pages.html IS 'содержание страницы';
CREATE INDEX index_html_pages_id ON sourse.html_pages USING BTREE (id);



CREATE TABLE sourse.files (
id serial,
name character varying(50), 
date_create timestamp with time zone,
date_mod timestamp with time zone,
user_mod integer, 
user_create integer, 
description character varying(100), 
url character varying(100), 
buf bytea, 
ext character varying(10) 
);
COMMENT ON TABLE sourse.files IS 'файлы';
COMMENT ON COLUMN sourse.files.name IS 'название';
COMMENT ON COLUMN sourse.files.date_create IS 'дата создания';
COMMENT ON COLUMN sourse.files.date_mod IS 'дата изменения';
COMMENT ON COLUMN sourse.files.user_mod IS 'кто изменил';
COMMENT ON COLUMN sourse.files.user_create IS 'кто создал';
COMMENT ON COLUMN sourse.files.description IS 'описание';
COMMENT ON COLUMN sourse.files.url IS 'путь до файла';
COMMENT ON COLUMN sourse.files.buf IS 'файл';
COMMENT ON COLUMN sourse.files.ext IS 'расширение файла';
CREATE INDEX index_files_id ON sourse.files USING BTREE (id);




CREATE TABLE sourse.images (
id serial,
name character varying(50), 
date_create timestamp with time zone, 
date_mod timestamp with time zone,
user_mod integer, 
user_create integer,
description character varying(100), 
url character varying(100), 
buf bytea, 
ext character varying(10)
);
COMMENT ON TABLE sourse.images IS 'картинки';
COMMENT ON COLUMN sourse.images.name IS 'название';
COMMENT ON COLUMN sourse.images.date_create IS 'дата создания';
COMMENT ON COLUMN sourse.images.date_mod IS 'дата изменения';
COMMENT ON COLUMN sourse.images.user_mod IS 'кто изменил';
COMMENT ON COLUMN sourse.images.user_create IS 'кто создал';
COMMENT ON COLUMN sourse.images.description IS 'описание';
COMMENT ON COLUMN sourse.images.url IS 'путь до файла';
COMMENT ON COLUMN sourse.images.buf IS 'файл';
COMMENT ON COLUMN sourse.images.ext IS 'расширение файла';
CREATE INDEX index_images_id ON sourse.images USING BTREE (id);


--НОВАЯ СХЕМА LOCALITIES

CREATE schema localities

CREATE TABLE localities.countrys (
id smallserial,
lang smallint,
name character varying(50), 
state_flag smallint, 
status smallint 
);
COMMENT ON TABLE localities.countrys IS 'страны';
COMMENT ON COLUMN localities.countrys.lang IS 'язык';
COMMENT ON COLUMN localities.countrys.name IS 'название';
COMMENT ON COLUMN localities.countrys.state_flag IS 'государственный флаг';
COMMENT ON COLUMN localities.countrys.status IS 'активна или нет для доставки и прочего';
CREATE INDEX index_countrys_id ON localities.countrys USING BTREE (id);



CREATE TABLE localities.translations (
id serial,
key text, 
lang smallint, 
content text, 
type smallint 
);
COMMENT ON TABLE localities.translations IS 'переводы';
COMMENT ON COLUMN localities.translations.key IS 'ключ';
COMMENT ON COLUMN localities.translations.lang IS 'язык';
COMMENT ON COLUMN localities.translations.content IS 'содержание';
COMMENT ON COLUMN localities.translations.type IS 'элемент интерфейса либо статья либо описание динамического элемента';
CREATE INDEX index_translations_id ON localities.translations USING BTREE (id);


CREATE TABLE localities.languages (
id smallserial,
name character varying(50), 
state_flag smallint 
);
COMMENT ON TABLE localities.languages IS 'переводы';
COMMENT ON COLUMN localities.languages.name IS 'язык';
COMMENT ON COLUMN localities.languages.state_flag IS 'государственный флаг';
CREATE INDEX index_languages_id ON localities.languages USING BTREE (id);



--НОВАЯ СХЕМА NEWS

CREATE schema news


CREATE TABLE news.articles (
id serial,
previwe character varying(50), 
status smallint,
html text, 
user_create integer, 
date_create timestamp with time zone, 
date_mod timestamp with time zone, 
user_mod integer, 
date_publisher timestamp with time zone, 
user_publisher integer,
title character varying(50), 
description character varying(100) 
);
COMMENT ON TABLE news.articles IS 'статьи';
COMMENT ON COLUMN news.articles.previwe IS 'превью статьи';
COMMENT ON COLUMN news.articles.status IS 'статус';
COMMENT ON COLUMN news.articles.html IS 'код статьи';
COMMENT ON COLUMN news.articles.user_create IS 'дата создания';
COMMENT ON COLUMN news.articles.date_create IS 'дата создания';
COMMENT ON COLUMN news.articles.date_mod IS 'дата изменения';
COMMENT ON COLUMN news.articles.user_mod IS 'кто изменил';
COMMENT ON COLUMN news.articles.date_publisher IS ' дата публикации';
COMMENT ON COLUMN news.articles.user_publisher IS 'кто опубликовал';
COMMENT ON COLUMN news.articles.title IS 'заголовок';
COMMENT ON COLUMN news.articles.description IS 'описание';
CREATE INDEX index_articles_id ON news.articles USING BTREE (id);




CREATE TABLE news.interface_elements (
id serial,
name character varying(50), 
type smallint, 
html text,
user_mod integer, 
date_mod timestamp with time zone, 
date_create timestamp with time zone, 
user_create integer 
);
COMMENT ON TABLE news.articles IS '(элементы интерфейса)';
COMMENT ON COLUMN news.interface_elements.name IS 'название элемента';
COMMENT ON COLUMN news.interface_elements.type IS 'тип элемента';
COMMENT ON COLUMN news.interface_elements.html IS 'код элемента';
COMMENT ON COLUMN news.interface_elements.user_mod IS 'кто изменил';
COMMENT ON COLUMN news.interface_elements.date_mod IS 'дата изменения';
COMMENT ON COLUMN news.interface_elements.date_create IS 'дата создания';
COMMENT ON COLUMN news.interface_elements.user_create IS 'дата создания';
CREATE INDEX index_interface_elements_id ON news.interface_elements USING BTREE (id);


--НОВАЯ СХЕМА CONTACTS

CREATE schema contacts

CREATE TABLE contacts.template_groups (
id serial,
name character varying(50), 
img character varying(100), 
order_groups smallint,
description character varying(100)
);
COMMENT ON TABLE contacts.template_groups IS '(шаблоны групп)';
COMMENT ON COLUMN contacts.template_groups.name IS 'название группы';
COMMENT ON COLUMN contacts.template_groups.img IS 'картинка группы';
COMMENT ON COLUMN contacts.template_groups.order_groups IS 'порядок';
COMMENT ON COLUMN contacts.template_groups.description IS 'описание';
CREATE INDEX index_template_groups_id ON contacts.template_groups USING BTREE (id);

CREATE TABLE contacts.Сontact_groups (
id serial,
user_id smallint, 
name character varying(50),
img character varying(100),
order_contact smallint, 
description character varying(100)
);
COMMENT ON TABLE contacts.Сontact_groups IS '(группы контактов)';
COMMENT ON COLUMN contacts.Сontact_groups.name IS 'название группы';
COMMENT ON COLUMN contacts.Сontact_groups.img IS 'картинка группы';
COMMENT ON COLUMN contacts.Сontact_groups.order_contact IS 'порядок';
COMMENT ON COLUMN contacts.Сontact_groups.description IS 'описание';
CREATE INDEX index_Сontact_groups_id ON contacts.Сontact_groups USING BTREE (id);
CREATE INDEX index_Сontact_groups_user_id ON contacts.Сontact_groups USING BTREE (user_id);

CREATE TABLE contacts.Сontacts (
id serial,
date_mod  timestamp with time zone, 
date_create timestamp with time zone, 
user_id integer, 
type smallint,
constructor_id integer,
card_id integer,
group_id integer,
notech character varying(100),
photo character varying(50), 
order_contacts smallint, 
url character varying(100) 
);
COMMENT ON TABLE contacts.Сontacts IS '(контакты)';
COMMENT ON COLUMN contacts.Сontacts.date_mod  IS 'дата модификации';
COMMENT ON COLUMN contacts.Сontacts.date_create IS 'дата создания';
COMMENT ON COLUMN contacts.Сontacts.user_id IS 'пользователь, у которого записан контакт';
COMMENT ON COLUMN contacts.Сontacts.type IS 'либо набранный вручную либо ссылающийся на визитку';
COMMENT ON COLUMN contacts.Сontacts.constructor_id IS 'конструктор где был набран контакт';
COMMENT ON COLUMN contacts.Сontacts.card_id IS 'id визитки, если контакт ссылается на готовую визитку';
COMMENT ON COLUMN contacts.Сontacts.group_id IS 'id  группы к которой принадлежит контакт';
COMMENT ON COLUMN contacts.Сontacts.notech IS 'заметка под контактом';
COMMENT ON COLUMN contacts.Сontacts.photo IS 'фото контакта';
COMMENT ON COLUMN contacts.Сontacts.order_contacts IS 'порядок';
COMMENT ON COLUMN contacts.Сontacts.url IS 'адрес контакта';
CREATE INDEX index_Сontacts_id ON contacts.Сontacts USING BTREE (id);
CREATE INDEX index_Сontacts_user_id ON contacts.Сontacts USING BTREE (user_id);
CREATE INDEX index_Сontacts_constructor_id ON contacts.Сontacts USING BTREE (constructor_id);
CREATE INDEX index_Сontacts_card_id ON contacts.Сontacts USING BTREE (card_id);
CREATE INDEX index_Сontacts_constructor_group_id ON contacts.Сontacts USING BTREE (group_id);


--НОВАЯ СХЕМА CONSTRUCTOR

CREATE schema constructor 


CREATE TABLE constructor.temlates_card (
id serial,
name character varying(100), 
text_color character varying(10), 
background_color character varying(10)
);
COMMENT ON TABLE constructor.temlates_card IS '(шаблоны визиток)';
COMMENT ON COLUMN constructor.temlates_card.name IS 'название шаблона';
COMMENT ON COLUMN constructor.temlates_card.text_color IS 'цвет текста';
COMMENT ON COLUMN constructor.temlates_card.background_color IS 'цвет фона';
CREATE INDEX index_temlates_card_id ON constructor.temlates_card USING BTREE (id);




CREATE TABLE constructor.temlates_link (
id serial,
name character varying(50), 
icon character varying(100),
title character varying(100), 
order_link smallint  
);
COMMENT ON TABLE constructor.temlates_link IS '(шаблоны блоков с контактами)';
COMMENT ON COLUMN constructor.temlates_link.name IS 'название шаблона';
COMMENT ON COLUMN constructor.temlates_link.icon IS 'иконка блока';
COMMENT ON COLUMN constructor.temlates_link.title IS 'заголовок (например "телефон")';
COMMENT ON COLUMN constructor.temlates_link.order_link IS 'порядок блока';
CREATE INDEX index_temlates_link_id ON constructor.temlates_link USING BTREE (id);



CREATE TABLE constructor.link_groups (
id serial,
name character varying(100), 
icon character varying(100) 
);
COMMENT ON TABLE constructor.link_groups IS '(группы блоков)';
COMMENT ON COLUMN constructor.link_groups.name IS 'название группы';
COMMENT ON COLUMN constructor.link_groups.icon IS 'иконка группы';
CREATE INDEX index_link_groups_id ON constructor.link_groups USING BTREE (id);



CREATE TABLE constructor.Constructors (
id serial,
date_create timestamp with time zone, 
date_mod timestamp with time zone, 
template_card integer,
name character varying(50), 
job character varying(100), 
bio character varying(100), 
photo character varying(100) 
);
COMMENT ON TABLE constructor.Constructors IS '(конструкторы визиток / контактов)';
COMMENT ON COLUMN constructor.Constructors.date_create IS 'дата создания';
COMMENT ON COLUMN constructor.Constructors.date_mod IS 'дата модификации';
COMMENT ON COLUMN constructor.Constructors.template_card IS 'шаблон визитки (цвета фона, текста и т д) ';
COMMENT ON COLUMN constructor.Constructors.name IS 'значение поля имени';
COMMENT ON COLUMN constructor.Constructors.job IS 'работа';
COMMENT ON COLUMN constructor.Constructors.bio IS 'раздел о себе';
COMMENT ON COLUMN constructor.Constructors.photo IS 'фото на визитке';
CREATE INDEX index_Constructors_id ON constructor.Constructors USING BTREE (id);



CREATE TABLE constructor.Links (
id serial,
constructor_id integer,
icon character varying(100), 
order_links smallint, 
title character varying(100), 
value character varying(100) 
);
COMMENT ON TABLE constructor.Links IS '(блоки из которых состоит страница с контактами)';
COMMENT ON COLUMN constructor.Links.constructor_id IS 'конструктор';
COMMENT ON COLUMN constructor.Links.icon IS 'иконка блока';
COMMENT ON COLUMN constructor.Links.order_links IS 'порядок блока';
COMMENT ON COLUMN constructor.Links.title IS 'заголовок (например "телефон")';
COMMENT ON COLUMN constructor.Links.value IS 'значение';
CREATE INDEX index_Links_id ON constructor.Links USING BTREE (id);
CREATE INDEX index_Links_constructor_id ON constructor.Links USING BTREE (constructor_id);


--НОВАЯ СХЕМА CARDS

CREATE schema cards 


CREATE TABLE cards.card (
id serial,
date_create timestamp with time zone, 
date_mod timestamp with time zone, 
user_id integer,
constructor_id integer,
urlc character varying(100), 
status smallint, 
microlink character varying(100), 
isMain boolean 
);
COMMENT ON TABLE cards.card IS '(визитки)';
COMMENT ON COLUMN cards.card.date_create IS 'дата создания';
COMMENT ON COLUMN cards.card.date_mod IS 'дата модификации';
COMMENT ON COLUMN cards.card.user_id IS 'id собственника визитки';
COMMENT ON COLUMN cards.card.constructor_id IS 'конструктор визитки';
COMMENT ON COLUMN cards.card.urlc IS 'адрес визитки';
COMMENT ON COLUMN cards.card.status IS 'статус визитки (активная - не активная )';
COMMENT ON COLUMN cards.card.microlink IS 'микроссылка для доступа к визитке';
COMMENT ON COLUMN cards.card.isMain IS 'флаг того, является ли визитка главной';
CREATE INDEX index_card_id ON cards.card USING BTREE (id);
CREATE INDEX index_card_user_id ON cards.card USING BTREE (user_id);
CREATE INDEX index_card_constructor_id ON cards.card USING BTREE (constructor_id);




--НОВАЯ СХЕМА REFERRALS

CREATE schema referrals


CREATE TABLE referrals.referral_events (
id serial,
name character varying(50),
description character varying(100), 
title character varying(100), 
icon character varying(100),
details_accruals json, 
date_create timestamp with time zone, 
user_mod integer, 
user_create integer, 
date_mod timestamp with time zone 
);
COMMENT ON TABLE referrals.referral_events IS '(события реферальных программ)';
COMMENT ON COLUMN referrals.referral_events.name IS 'название события';
COMMENT ON COLUMN referrals.referral_events.description IS 'описание события';
COMMENT ON COLUMN referrals.referral_events.title IS 'заголовок';
COMMENT ON COLUMN referrals.referral_events.icon IS 'иконка события для отображения аналитики на фронте';
COMMENT ON COLUMN referrals.referral_events.details_accruals IS 'структура описывающая вознаграждение за событие';
COMMENT ON COLUMN referrals.referral_events.date_create IS 'дата создания';
COMMENT ON COLUMN referrals.referral_events.user_mod IS 'кто изменил';
COMMENT ON COLUMN referrals.referral_events.user_create IS 'кто создал';
COMMENT ON COLUMN referrals.referral_events.date_mod IS 'дата изменения';
CREATE INDEX index_referral_events_id ON referrals.referral_events USING BTREE (id);



CREATE TABLE referrals.referral_programs (
id serial,
name character varying(100), 
status smallint, 
date_start timestamp with time zone, 
date_end timestamp with time zone, 
date_create timestamp with time zone, 
date_mod timestamp with time zone, 
user_create integer, 
user_mod integer, 
levels smallint, 
description text, 
details json, 
price integer, 
unavailable_balance integer 
 
);
COMMENT ON TABLE referrals.referral_programs IS '(реферальные программы)';
COMMENT ON COLUMN referrals.referral_programs.name IS 'название программы';
COMMENT ON COLUMN referrals.referral_programs.status IS 'статус программы';
COMMENT ON COLUMN referrals.referral_programs.date_start IS 'дата начала программы';
COMMENT ON COLUMN referrals.referral_programs.date_end IS 'дата окончания программы';
COMMENT ON COLUMN referrals.referral_programs.date_create IS 'дата создания';
COMMENT ON COLUMN referrals.referral_programs.date_mod IS 'дата изменения';
COMMENT ON COLUMN referrals.referral_programs.user_create IS 'кто создал';
COMMENT ON COLUMN referrals.referral_programs.user_mod IS 'кто изменил';
COMMENT ON COLUMN referrals.referral_programs.levels IS 'количество уровней партнерства';
COMMENT ON COLUMN referrals.referral_programs.description IS 'описание программы';
COMMENT ON COLUMN referrals.referral_programs.details IS 'структура описывающая программу';
COMMENT ON COLUMN referrals.referral_programs.price IS 'цена за программу';
COMMENT ON COLUMN referrals.referral_programs.unavailable_balance IS 'часть баланса, которая будет замораживаться';
CREATE INDEX index_referral_programs_id ON referrals.referral_programs USING BTREE (id);






CREATE TABLE referrals.referral_balance (
id serial,
user_id integer,
balance integer, 
unavailable integer  

);
COMMENT ON TABLE referrals.referral_balance IS '(баланс партнера)';
COMMENT ON COLUMN referrals.referral_balance.balance IS 'баланс';
COMMENT ON COLUMN referrals.referral_balance.unavailable IS 'замороженная часть баланса';
CREATE INDEX index_referral_balance_id ON referrals.referral_balance USING BTREE (id);
CREATE INDEX index_referral_balance_user_id ON referrals.referral_balance USING BTREE (user_id);





CREATE TABLE referrals.referral_accruals (
id serial,
event_id integer, 
user_id integer,
parther_id integer, 
level smallint, 
referral_subscribe_id integer, 
type smallint, 
sum integer, 
carrency smallint, 
details json,
date timestamp with time zone 
);
COMMENT ON TABLE referrals.referral_accruals IS '(начисления по реферальным программам)';
COMMENT ON COLUMN referrals.referral_accruals.event_id IS 'событие';
COMMENT ON COLUMN referrals.referral_accruals.user_id IS 'кому начислили';
COMMENT ON COLUMN referrals.referral_accruals.parther_id IS 'за кого начислили';
COMMENT ON COLUMN referrals.referral_accruals.level IS 'уровень партнерства';
COMMENT ON COLUMN referrals.referral_accruals.referral_subscribe_id IS 'по какой подписке начислили';
COMMENT ON COLUMN referrals.referral_accruals.type IS 'тип начисления';
COMMENT ON COLUMN referrals.referral_accruals.sum IS 'сумма';
COMMENT ON COLUMN referrals.referral_accruals.carrency IS 'валюта';
COMMENT ON COLUMN referrals.referral_accruals.details IS 'структура описывающая начисление';
COMMENT ON COLUMN referrals.referral_accruals.date IS 'дата начисления';
CREATE INDEX index_referral_accruals_id ON referrals.referral_accruals USING BTREE (id);
CREATE INDEX index_referral_accruals_event_id ON referrals.referral_accruals USING BTREE (event_id);
CREATE INDEX index_referral_accruals_user_id ON referrals.referral_accruals USING BTREE (user_id);
CREATE INDEX index_referral_accruals_parther_id ON referrals.referral_accruals USING BTREE (parther_id);






CREATE TABLE referrals.referral_analitics (
id serial,
user_id integer, 
referral_subscribe_id integer, 
event_id integer, 
details json,
date timestamp with time zone 
);
COMMENT ON TABLE referrals.referral_analitics IS '(аналитика по реферальным программам)';
COMMENT ON COLUMN referrals.referral_analitics.user_id IS 'партнер';
COMMENT ON COLUMN referrals.referral_analitics.referral_subscribe_id IS 'подписка партнера';
COMMENT ON COLUMN referrals.referral_analitics.event_id IS 'событие';
COMMENT ON COLUMN referrals.referral_analitics.details IS 'структура описывающая событие';
COMMENT ON COLUMN referrals.referral_analitics.date IS 'дата события';
CREATE INDEX index_referral_analitics_event_id ON referrals.referral_analitics USING BTREE (event_id);
CREATE INDEX index_referral_analitics_event_user_id ON referrals.referral_analitics USING BTREE (user_id);
CREATE INDEX index_referral_analitics_event_event_id ON referrals.referral_analitics USING BTREE (event_id);





CREATE TABLE referrals.referral_subscribes (
id serial,
referral_program_id integer,
user_id integer,
created_date timestamp with time zone, 
status_change_date timestamp with time zone, 
status smallint, 
day_payment timestamp with time zone, 
unavailable_balance  integer 
);
COMMENT ON TABLE referrals.referral_subscribes IS '(подписки на реферальные программы)';
COMMENT ON COLUMN referrals.referral_subscribes.referral_program_id IS 'программа';
COMMENT ON COLUMN referrals.referral_subscribes.user_id IS 'партнер';
COMMENT ON COLUMN referrals.referral_subscribes.created_date IS 'дата создания записи';
COMMENT ON COLUMN referrals.referral_subscribes.status_change_date IS 'дата изменения статуса';
COMMENT ON COLUMN referrals.referral_subscribes.status IS 'статус подписки';
COMMENT ON COLUMN referrals.referral_subscribes.day_payment IS 'день оплаты';
COMMENT ON COLUMN referrals.referral_subscribes.unavailable_balance IS 'часть баланса, которая будет замораживаться ';
CREATE INDEX index_referral_subscribes_id ON referrals.referral_subscribes USING BTREE (id);
CREATE INDEX index_referral_subscribes_user_id ON referrals.referral_subscribes USING BTREE (user_id);








--НОВАЯ СХЕМА ADMIN

CREATE schema admin


CREATE TABLE admin.users (
id serial,
date_create timestamp with time zone,
date_mod timestamp with time zone,
account character varying(50),
firstname character varying(50), 
lastname character varying(50), 
role_id integer, 
balance smallint, 
main_url character varying(100), 
referredBy integer, 
email character varying(100), 
email_confirm boolean, 
email_confirm_code character varying(100), 
password_hash character varying(100), 
lang smallint, 
location smallint 
);
COMMENT ON TABLE admin.users IS '(пользователи)';
COMMENT ON COLUMN admin.users.date_create IS 'дата создания аккаунта';
COMMENT ON COLUMN admin.users.date_mod IS 'дата изменения аккаунта';
COMMENT ON COLUMN admin.users.account IS 'имя аккаунта';
COMMENT ON COLUMN admin.users.firstname IS 'имя пользователя';
COMMENT ON COLUMN admin.users.lastname IS 'фамилия пользователя';
COMMENT ON COLUMN admin.users.role_id IS 'id роли пользователя';
COMMENT ON COLUMN admin.users.balance IS 'текущий баланс';
COMMENT ON COLUMN admin.users.main_url IS 'url активной визитки';
COMMENT ON COLUMN admin.users.referredBy IS '(user_id кто привел)';
COMMENT ON COLUMN admin.users.email IS 'почта';
COMMENT ON COLUMN admin.users.email_confirm IS 'флаг подтверждения почты';
COMMENT ON COLUMN admin.users.email_confirm_code IS 'код подтверждения почты';
COMMENT ON COLUMN admin.users.password_hash IS 'пароль';
COMMENT ON COLUMN admin.users.lang IS 'язык по умолчанию';
COMMENT ON COLUMN admin.users.location IS 'страна пребывания';
CREATE INDEX index_users_id ON admin.users USING BTREE (id);
CREATE INDEX index_users_role_id ON admin.users USING BTREE (role_id);

CREATE table admin.apps (
id SMALLSERIAL PRIMARY KEY,
name VARCHAR(50),
title VARCHAR(50),
description VARCHAR(100)
);
COMMENT ON TABLE admin.apps IS 'модули сервиса okey';
COMMENT ON COLUMN admin.apps.name IS 'Название модуля';
COMMENT ON COLUMN admin.apps.title IS 'Заголовок модуля';
COMMENT ON COLUMN admin.apps.description IS 'Описание модуля';

insert into admin.apps (name, title, description)
values ('AUTH', 'Модуль авторизации', 'Обеспечивает регистрацию пользователей и их авторизацию'),
('ADMIN', 'Модуль администрирования', 'Обеспечивает работу с пользователями'),
('AUDIT', 'Модуль аудита','Обеспечивает работу аудита и всех остальных модулей'),
('CARDS', 'Модуль для работы с визитками','Предоставляет функциональность создания, хранения, просмотра, редактирования и удаления визиток'),
('CONTACTS', 'Модуль работы с контактами','Обеспечивает  возможность обмена контактами с другими пользователями,а так же совешать заметки'),
('DEVICES', 'Модуль для работы с устройствами','Предоставляет  функциональность регистрации, мониторинга, управления различных типов устройств'),
('LINKS', 'Модуль для работы с временными ссылками','Помогает в создания временных ссылок, которые могут истекать по времени или количеству кликов'),
('LOCALS', 'Модуль перевода','Помощь автоматического или ручного перевода текста, создания и хранения локализованных версий контента'),
('LOGS', 'Модуль логирования.','Отвечает за сбор, хранение и анализ логов системы, логи могут содержать различную информацию, например, о запросах к серверу, ошибках, действиях пользователей и другое'),
('MESSAGES', 'Модуль  для работы с сообщениями','Отвечает за реализацию функциональности сообщений в системе. Например, это может быть модуль для работы с электронной почтой, сообщениями в чате, SMS и другими типами сообщений'),
('PAYS', 'Модуль микросервиса для работы с платежами и тразакциями','Обеспечивает возможность оплаты в системе, интеграция с  платежными системами, такими как Visa, Mastercard, PayPal и другими'),
('REFFERALS', 'Модуль для работы с реферальными программами',' Обеспечивает реализацию реферальной программы в системе,позволяет обрабатывать информацию о рефералах, генерировать и отслеживать реферальные ссылки, а также отслеживать  вознаграждения за привлечение новых клиентов.'),
('SOURCE', 'Модуль для работы с файлами','Помогает в сборе и аналитике данных в системе, обрабатывать данные о посетителях, источниках и каналах как они проходят через систему'),
('STORE', 'Модуль для работы с магазином устройств','Отвечает за реализацию функциональности интернет магазина в системе, помогает обрабатывать информацию о товарах, категориях, заказах и клиентах, а также реализовывать функционал корзины и оформления заказов'),
('SUPPORT', 'Модуль тех поддержки клиентов', 'Отвечает за реализацию функциональности системы технической поддержки в системе, может обрабатывать информацию о запросах поддержки, обращениях и тикетах, а также реализовывать функционал для обработки и распределения запросов между операторами'),
('TARIFFS', 'Модуль для работы с тарифами', 'Отвечает за управление тарифными планами в системе, может обрабатывать информацию о различных тарифных планах, их характеристиках и ценах');




--НОВАЯ СХЕМА DEVICES

CREATE schema devices

CREATE TABLE devices.devices (
id serial,
order_id integer, 
user_id integer, 
urlc character varying(100), 
redirect_url character varying(100), 
device_template integer,  
device_type smallint, 
status smallint 
);
COMMENT ON TABLE devices.devices IS '(физические устройства)';
COMMENT ON COLUMN devices.devices.order_id IS 'заказ по которому было создано устройство';
COMMENT ON COLUMN devices.devices.user_id IS 'тот кто активировал ';
COMMENT ON COLUMN devices.devices.urlc IS 'ссылка на устройстве';
COMMENT ON COLUMN devices.devices.redirect_url IS 'ссылка на визитку';
COMMENT ON COLUMN devices.devices.device_template IS 'шаблон устройства';
COMMENT ON COLUMN devices.devices.device_type IS 'тип устройства';
COMMENT ON COLUMN devices.devices.status IS 'статус устройства';
CREATE INDEX index_devices_id ON devices.devices USING BTREE (id);
CREATE INDEX index_devices_order_id ON devices.devices USING BTREE (order_id);
CREATE INDEX index_devices_user_id ON devices.devices USING BTREE (user_id);






CREATE TABLE devices.device_templates (
id serial,
device_type smallint,  
type smallint, 
isMain boolean, 
struct json 
);
COMMENT ON TABLE devices.device_templates IS '(шаблоны устройств)';
COMMENT ON COLUMN devices.device_templates.device_type IS 'тип устройства';
COMMENT ON COLUMN devices.device_templates.type IS 'кастомный или дефолтный';
COMMENT ON COLUMN devices.device_templates.isMain IS 'флаг того что шаблон главный';
COMMENT ON COLUMN devices.device_templates.struct IS 'описание параметров в json';
CREATE INDEX index_device_templates_id ON devices.device_templates USING BTREE (id);




CREATE TABLE devices.ref_device_types (
id smallserial,
name character varying(50),
title character varying(100), 
description character varying(100), 
price integer,  
discount integer, 
discount_for_custom_version integer, 
price_for_custom_version integer 
);
COMMENT ON TABLE devices.ref_device_types IS '(типы устройств)';
COMMENT ON COLUMN devices.ref_device_types.name IS 'название типа';
COMMENT ON COLUMN devices.ref_device_types.title IS 'заголовок';
COMMENT ON COLUMN devices.ref_device_types.description IS 'описание';
COMMENT ON COLUMN devices.ref_device_types.price IS 'цена';
COMMENT ON COLUMN devices.ref_device_types.discount IS 'скидка';
COMMENT ON COLUMN devices.ref_device_types.discount_for_custom_version IS 'скидка для кастомной версии';
COMMENT ON COLUMN devices.ref_device_types.price_for_custom_version IS 'цена для кастомной версии';
CREATE INDEX index_ref_device_types_id ON devices.ref_device_types USING BTREE (id);




--НОВАЯ СХЕМА STORE

CREATE schema store

CREATE TABLE store.orders (
id serial,
user_id integer,
invoice_id integer,
date_create timestamp with time zone, 
date_cancellation timestamp with time zone, 
date_finised timestamp with time zone, 
delivery_date timestamp with time zone, 
sum integer, 
status smallint, 
delivery_address json, 
contact_details json, 
shiping_method smallint,
send_email_about_change boolean
);
COMMENT ON TABLE store.orders IS '(заказы на устройства)';
COMMENT ON COLUMN store.orders.user_id IS 'заказчик';
COMMENT ON COLUMN store.orders.invoice_id IS 'счет по заказу';
COMMENT ON COLUMN store.orders.date_create IS 'дата создания';
COMMENT ON COLUMN store.orders.date_cancellation IS 'дата отмены';
COMMENT ON COLUMN store.orders.date_finised IS 'дата завершения';
COMMENT ON COLUMN store.orders.delivery_date IS 'предполагаемая дата доставки';
COMMENT ON COLUMN store.orders.sum IS 'общая сумма заказа';
COMMENT ON COLUMN store.orders.status IS 'в том числе и статус в корзине и в ожидании';
COMMENT ON COLUMN store.orders.delivery_address IS 'json доставки';
COMMENT ON COLUMN store.orders.contact_details IS 'json контактная информация';
COMMENT ON COLUMN store.orders.shiping_method IS 'метод доставки';
COMMENT ON COLUMN store.orders.send_email_about_change IS 'сообщать об изменениях';
CREATE INDEX index_orders_id ON store.orders USING BTREE (id);
CREATE INDEX index_orders_user_id ON store.orders USING BTREE (user_id);
CREATE INDEX index_orders_invoice_id ON store.orders USING BTREE (invoice_id);





CREATE TABLE store.ordered_devices (
id serial,
order_id integer, 
price integer, 
device_template integer, 
device_type smallint, 
amount smallint, 
sum integer 
);
COMMENT ON TABLE store.ordered_devices IS '(заказанные устройства)';
COMMENT ON COLUMN store.ordered_devices.order_id IS 'заказ';
COMMENT ON COLUMN store.ordered_devices.price IS 'цена';
COMMENT ON COLUMN store.ordered_devices.device_template IS 'шаблон';
COMMENT ON COLUMN store.ordered_devices.device_type IS 'тип';
COMMENT ON COLUMN store.ordered_devices.amount IS 'количество';
COMMENT ON COLUMN store.ordered_devices.sum IS 'общая сумма';
CREATE INDEX index_ordered_devices_id ON store.ordered_devices USING BTREE (id);
CREATE INDEX index_ordered_devices_order_id ON store.ordered_devices USING BTREE (order_id);





--НОВАЯ СХЕМА PAYS

CREATE schema pays



CREATE TABLE pays.invoices (
id serial,
user_id integer,
type smallint, 
sum integer,
carrency smallint, 
pay_system smallint, 
pay_service smallint, 
status smallint,
pay_details  json, 
data_create timestamp with time zone, 
date_mod timestamp with time zone 
);
COMMENT ON TABLE pays.invoices IS '(счета)';
COMMENT ON COLUMN pays.invoices.user_id IS 'пользователь';
COMMENT ON COLUMN pays.invoices.type IS 'тип счета';
COMMENT ON COLUMN pays.invoices.sum IS 'сумма';
COMMENT ON COLUMN pays.invoices.carrency IS 'валюта';
COMMENT ON COLUMN pays.invoices.pay_system IS 'платежная система';
COMMENT ON COLUMN pays.invoices.pay_service IS 'сервис платежа';
COMMENT ON COLUMN pays.invoices.status IS 'статус счета';
COMMENT ON COLUMN pays.invoices.pay_details IS 'платежная информация';
COMMENT ON COLUMN pays.invoices.data_create IS 'дата создания';
COMMENT ON COLUMN pays.invoices.date_mod IS 'дата изменения';
CREATE INDEX index_invoices_id ON pays.invoices USING BTREE (id);
CREATE INDEX index_invoices_user_id ON pays.invoices USING BTREE (user_id);



CREATE TABLE pays.transactions (
id serial,
user_id integer, 
type smallint, 
sum integer, 
carrency smallint, 
date timestamp with time zone, 
detail json 
);
COMMENT ON TABLE pays.transactions IS 'транзакции';
COMMENT ON COLUMN pays.transactions.user_id IS 'пользователь';
COMMENT ON COLUMN pays.transactions.type IS 'тип транзакции';
COMMENT ON COLUMN pays.transactions.sum IS 'сумма';
COMMENT ON COLUMN pays.transactions.carrency IS 'валюта';
COMMENT ON COLUMN pays.transactions.date IS 'дата';
COMMENT ON COLUMN pays.transactions.detail IS 'json описание';
CREATE INDEX index_transactions_id ON pays.transactions USING BTREE (id);
CREATE INDEX index_transactions_user_id ON pays.transactions USING BTREE (user_id);







CREATE TABLE pays.balance_operation (
id serial,
date timestamp with time zone, 
user_id integer, 
type smallint, 
sum integer, 
carrency smallint, 
wallet_type smallint, 
detail json 
);
COMMENT ON TABLE pays.balance_operation IS 'операции баланса';
COMMENT ON COLUMN pays.balance_operation.date IS 'дата';
COMMENT ON COLUMN pays.balance_operation.user_id IS 'пользователь';
COMMENT ON COLUMN pays.balance_operation.type IS 'тип операции';
COMMENT ON COLUMN pays.balance_operation.sum IS 'сумма';
COMMENT ON COLUMN pays.balance_operation.carrency IS 'валюта';
COMMENT ON COLUMN pays.balance_operation.wallet_type IS 'тип кошелька';
COMMENT ON COLUMN pays.balance_operation.detail IS 'json описание';
CREATE INDEX index_balance_operation_id ON pays.balance_operation USING BTREE (id);
CREATE INDEX index_balance_operation_user_id ON pays.balance_operation USING BTREE (user_id);





CREATE TABLE pays.pay_service (
id serial,
name varchar(50), 
country smallint, 
option_json json, 
status smallint  
);
COMMENT ON TABLE pays.pay_service IS 'счета';
COMMENT ON COLUMN pays.pay_service.name IS 'название сервиса';
COMMENT ON COLUMN pays.pay_service.country IS 'страна где работает сервис';
COMMENT ON COLUMN pays.pay_service.option_json IS 'настройки сервиса';
COMMENT ON COLUMN pays.pay_service.status IS 'статус';
CREATE INDEX index_pay_service_id ON pays.pay_service USING BTREE (id);




--НОВАЯ СХЕМА AUDIT

CREATE schema audit



CREATE TABLE audit.logs (
id bigserial,
service smallint,
type smallint, 
date timestamp with time zone, 
message text 
);
COMMENT ON TABLE audit.logs IS 'логи';
COMMENT ON COLUMN audit.logs.service IS 'сервис';
COMMENT ON COLUMN audit.logs.type IS 'тип лога (Error, Debug, Info)';
COMMENT ON COLUMN audit.logs.date IS 'дата';
COMMENT ON COLUMN audit.logs.message IS 'сообщение';
CREATE INDEX index_logs_id ON audit.logs USING BTREE (id);




CREATE TABLE audit.user_audit (
id bigserial,
user_id integer, 
action smallint, 
object_type smallint, 
object_id integer, 
date timestamp with time zone,
detail json 
);
COMMENT ON TABLE audit.user_audit IS 'аудит по действия пользователя';
COMMENT ON COLUMN audit.user_audit.user_id IS 'пользователь';
COMMENT ON COLUMN audit.user_audit.action IS 'действие';
COMMENT ON COLUMN audit.user_audit.object_type IS 'объект действия (тип)';
COMMENT ON COLUMN audit.user_audit.object_id IS 'ссылка на конкретный объект';
COMMENT ON COLUMN audit.user_audit.date IS 'время действия';
COMMENT ON COLUMN audit.user_audit.detail IS 'детализация';
CREATE INDEX index_user_audit_id ON audit.user_audit USING BTREE (id);
CREATE INDEX index_user_audit_user_id ON audit.user_audit USING BTREE (user_id);
CREATE INDEX index_user_audit_object_id ON audit.user_audit USING BTREE (object_id);






--НОВАЯ СХЕМА MESSAGES

CREATE schema messages

CREATE TABLE messages.notifications_for_dispatch (
id serial,
user_id integer, 
text text, 
type smallint, 
status smallint,
date_sent  timestamp with time zone
);
COMMENT ON TABLE messages.notifications_for_dispatch IS 'уведомления для отправки';
COMMENT ON COLUMN messages.notifications_for_dispatch.user_id IS 'адресат уведомления, если пустая строка, то всем';
COMMENT ON COLUMN messages.notifications_for_dispatch.text IS 'текст уведомления';
COMMENT ON COLUMN messages.notifications_for_dispatch.type IS 'тип уведомления';
COMMENT ON COLUMN messages.notifications_for_dispatch.status IS 'статус уведомления';
COMMENT ON COLUMN messages.notifications_for_dispatch.date_sent IS 'когда отправить уведомление, если пусто, то тут же';
CREATE INDEX index_notifications_for_dispatch_id ON messages.notifications_for_dispatch USING BTREE (id);
CREATE INDEX index_notifications_for_dispatch_user ON messages.notifications_for_dispatch USING BTREE (user_id);






CREATE TABLE messages.notifications_sent (
id serial,
user_id integer,
text text,
type smallint, 
notifications_for_dispatch_id integer,
isRead boolean, 
date_sending timestamp with time zone 
);
COMMENT ON TABLE messages.notifications_sent IS 'уведомления отправленные';
COMMENT ON COLUMN messages.notifications_sent.user_id IS 'адресат уведомления, если пустая строка, то всем';
COMMENT ON COLUMN messages.notifications_sent.text IS 'текст уведомления';
COMMENT ON COLUMN messages.notifications_sent.type IS 'тип уведомления';
COMMENT ON COLUMN messages.notifications_sent.notifications_for_dispatch_id IS 'ссылка на уведомление';
COMMENT ON COLUMN messages.notifications_sent.isRead IS 'флаг прочитано ли уведомление';
COMMENT ON COLUMN messages.notifications_sent.date_sending IS 'дата отправки';
CREATE INDEX index_notifications_sent_id ON messages.notifications_sent USING BTREE (id);
CREATE INDEX index_notifications_sent_user_id ON messages.notifications_sent USING BTREE (user_id);




CREATE TABLE messages.mailing_list (
id serial,
user_id integer, 
html text, 
type smallint, 
date_sent  timestamp with time zone,
date_sending timestamp with time zone, 
status smallint 
);
COMMENT ON TABLE messages.mailing_list IS 'email рассылка';
COMMENT ON COLUMN messages.mailing_list.user_id IS 'если равно 0 то значит всем';
COMMENT ON COLUMN messages.mailing_list.html IS 'код письма';
COMMENT ON COLUMN messages.mailing_list.type IS 'тип рассылки';
COMMENT ON COLUMN messages.mailing_list.date_sent IS 'когда отправить письмо, если пусто, то тут же';
COMMENT ON COLUMN messages.mailing_list.date_sending IS 'дата отправки';
COMMENT ON COLUMN messages.mailing_list.status IS 'статус';
CREATE INDEX index_mailing_list_id ON messages.mailing_list USING BTREE (id);
CREATE INDEX index_mailing_list_user_id ON messages.mailing_list USING BTREE (user_id);




--НОВАЯ СХЕМА ROUTER

CREATE schema router


CREATE TABLE router.temp_pages (
id bigserial,
url character varying(100),
data json, 
type smallint, 
date_create timestamp with time zone, 
deadline timestamp with time zone 
);
COMMENT ON TABLE router.temp_pages IS 'маршрутизатор для временных ссылок';
COMMENT ON COLUMN router.temp_pages.data IS 'данные для временной страницы';
COMMENT ON COLUMN router.temp_pages.type IS 'тип страницы - сброс пароля, подтверждение почты, шаринг контактов';
COMMENT ON COLUMN router.temp_pages.date_create IS 'дата создания';
COMMENT ON COLUMN router.temp_pages.deadline IS 'время жизни ссылки';
CREATE INDEX index_temp_pages_id ON router.temp_pages USING BTREE (id);





