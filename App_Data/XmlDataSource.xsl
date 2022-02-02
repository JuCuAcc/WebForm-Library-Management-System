<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes"/>
    <xsl:template match="/books">
		<html>
			<head>
			<title>Available Books in store</title>
			<style type="text/css">
				body{
					font-family: 'Century Gothic';		
					font-size: .80em;
				}
			</style>					
			</head>
			<body>
				<h1>Available Books in store:</h1>
					<div>
						<table border="1">
							<thead>
								<th>Name</th>
								<th>Author</th>
								<th>Price</th>
								<th>Edition</th>						
								<th>Publisher</th>						
							</thead>
							<tbody>
								<xsl:for-each select="book" >
									<xsl:if test ="@available='yes'" >
										<tr>
											<td>
												<xsl:value-of select="name" />
											</td>
											<td>
												<xsl:value-of select="author" />
											</td>
											<td>
												$<xsl:value-of select="price" />
											</td>
											<td>
												<xsl:value-of select="edition" />
											</td>
											<td>
												<xsl:value-of select="publisher" />
											</td>
										</tr>
									</xsl:if>
								</xsl:for-each>																			
							</tbody>						
						</table>				
					</div>			
			</body>		
		</html>
</xsl:template>
</xsl:stylesheet>
