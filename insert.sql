-- Функция для генерации случайных байтовых значение типа bytea (нужно для имитации видеоконтента)
CREATE OR REPLACE FUNCTION random_bytea(bytea_length integer)
    RETURNS bytea AS $body$
SELECT decode(
    string_agg(
        lpad(
            to_hex(
                width_bucket(random(), 0, 1, 256) - 1
            ),
            2,
            '0'
        ),
        ''
    ),
    'hex'
)
FROM generate_series(1, $1);
$body$
    LANGUAGE 'sql'
    VOLATILE
    SET search_path = 'pg_catalog';


-- Добавление тестовых данных
INSERT INTO objects(obj_id, obj_name, obj_description, obj_color)
VALUES (
    0,
    'Плато',
    'Границы очерчены чрезвычайно резко. Оно совсем гладкое, ни щербинки не видно. Может быть, это даже жидкость - поверхность как будто плоская.',
    'Белый'
);

INSERT INTO videograms(vid_id, vid_name, vid_date_of_creation, vid_content)
VALUES (0, 'Первое видео', default, random_bytea(1000)),
       (1, 'Второе видео', default, random_bytea(912)),
       (2, 'Третье видео', default, random_bytea(450));

INSERT INTO objects_in_videograms(obj_id, vid_id)
VALUES (0, 0),
       (0, 1),
       (0, 2);

INSERT INTO users()