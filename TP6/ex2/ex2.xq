xquery version "1.0";
declare option saxon:output "omit-xml-declaration=yes";
<html>
	<body>
		<table>
			<thead>
				<tr>
					<th>Maisons</th>
					<th>Surfaces (m2)</th>
				</tr>
			</thead>
			<tbody>
				{
				for $m in doc("maisons.xml")//maisons/maison return
				<tr>
					<td>Maison {data($m/@id)}</td>
					<td>{sum($m/*/*/@surface-m2)}</td>
				</tr>
				}
			</tbody>
		</table>
	</body>
</html>