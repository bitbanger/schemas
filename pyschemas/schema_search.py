from collections import defaultdict

class SchemaSearcher:
	def __init__(self, schemas):
		self.schemas = schemas

		self.role_pred_map = defaultdict(set)

		for schema in schemas:
			if 'roles' not in schema.sections_by_name:
				continue
			roles = schema.sections_by_name['roles']
			for phi in roles.formulas:
				pred = phi.formula.formula[1]
				if type(pred) != list:
					self.role_pred_map[pred].add(schema)

	def schemas_by_role_pred(self, pred):
		return self.role_pred_map[pred]

	def schemas_by_role_preds(self, preds):
		schemas = None
		for pred in preds:
			s = self.schemas_by_role_pred(pred)
			if schemas is None:
				schemas = set(s)
			else:
				schemas = schemas.intersection(s)

		return schemas
