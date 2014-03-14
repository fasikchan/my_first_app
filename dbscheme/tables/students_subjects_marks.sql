CREATE TABLE student_subject_marks (
    student_id bigint NOT NULL,
    subject_id bigint NOT NULL,
    mark integer NOT NULL,
    PRIMARY KEY (student_id, subject_id)
);
