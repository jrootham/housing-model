open Format

let usage_msg = "model -y years -r runs -c context.json -p project.json output.csv"

let years = ref 25
let runs = ref 10
let context_file = ref ""
let project_file = ref ""
let output_file = ref ""

let tmp = ref ""
let anon_fun bad = tmp := bad

let validate years runs context project output do_not =
	years > 0 && years <= 100
	&& runs > 0 && runs <= 1000
	&& context <> ""
	&& project <> ""
	&& output <> ""
	&& do_not = ""

let speclist =
  [
    ("-y", Arg.Set_int years, "Number of years");
    ("-r", Arg.Set_int runs, "Number of runs");
    ("-c", Arg.Set_string context_file, "Context file name");
    ("-p", Arg.Set_string project_file, "Project file name");
    ("-o", Arg.Set_string output_file, "Output file name");
  ]

let () = Arg.parse speclist anon_fun usage_msg;

if validate !years !runs !context_file !project_file !output_file !tmp 
then
	printf "Context=%s Project=%s output=%s\n" !context_file !project_file !output_file
else
	Arg.usage speclist usage_msg




