@subjects = Subject.connection.select_all("SELECT subjects.name, student_subject_marks.mark
                                     FROM subjects
                                     INNER JOIN student_subject_marks
                                     ON subjects.id = student_subject_marks.subject_id
                                     WHERE student_id = #{c}")
