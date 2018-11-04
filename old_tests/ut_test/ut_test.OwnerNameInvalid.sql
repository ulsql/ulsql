PROMPT Reports error when test owner name for a test is invalid

--Arrange
declare
  simple_test ut_test := ut_test(
    a_object_owner => 'invalid owner name',
    a_object_name => 'ut_example_tests',
    a_name => 'ut_passing_test',
    a_line_no => null);
begin
--Act
  simple_test.do_execute();

--Assert
  if simple_test.result = ut_utils.gc_error then
    :test_result := ut_utils.gc_success;
  else
    dbms_output.put_line('simple_test.result = '||ut_utils.test_result_to_char(simple_test.result));
  end if;
end;
/
