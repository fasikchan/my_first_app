CREATE TABLE students (
    id bigserial NOT NULL,
    name varchar NOT NULL,
    family varchar NOT NULL,
    age integer NOT NULL,
    in_group integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    PRIMARY KEY (id)
);
