from schema import ELFormula, Schema, Section, schema_from_file, schema_and_protos_from_file, rec_replace
from schema_match import prop_to_vec, grounded_schema_prop, grounded_prop, rec_get_vars, rec_get_advs, is_adv, has_suff, rec_get_pred
from sexpr import list_to_s_expr, parse_s_expr
from el_expr import pre_arg, verb_pred, post_args

def schema_html(schema):
	buf = []
	for section in 

schema_webpage_template = '''<html>
<head>
<script>
</script>
<style>
body {
    background-color: #666666;
}
p {
    margin: 8px;
}
.schema {
    font-family: monospace;
    font-size: 18px;
    line-height: 0.5;
    border: 2px solid black;
    border-radius: 10px;
    display: inline-block;
    padding: 10px;
    background: #EFE7DB;
    flex: 1 1 auto;
}
.epi-schema {
    font-weight: bold;
    font-size: 18px;
}
.section-title {
    font-weight: bold;
    font-size: 18px;
}
.el-prop {
    font-size: 14px;
}
.nonfluent-id {
    font-weight: bold;
    color: #BB0000;
}
.fluent-id {
    font-weight: bold;
    color: #0000FF;
}
.charstar {
    font-weight: bold;
}
.variable {
    font-weight: bold;
}
.eng {
    font-family: serif;
    font-size: 16px;
    border-radius: 2px;
    border: 1px dotted black;
    color: #000000;
}
.step {
    border: 1px dotted black;
    border-radius: 4px;
    display: inline-block;
    margin-left: 80px;
    margin-top: 10px;
    padding-bottom: 4px;
}
</style>
<title>Schema</title>
</head>
<body>
%s
</body>
</html>'''
