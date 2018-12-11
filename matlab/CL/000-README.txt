*******************************************************************
** Instructions pour l'utilisation des fichiers d'initialisation **
*******************************************************************


Conseils pour importer les fichiers dans Matlab:
------------------------------------------------

Utiliser la commande dlmread en précisant que les séparateurs sont des tabulations (\t)
ex: my_matrix = dlmread('my_file.txt','\t');

La pas de discrétisation est précisé ci-dessous.


Conventions:
------------

Pour chaque cas à faire passer, 3 matrices sont fournies:
	1) Une matrice représentant le domaine géométrique (appelée dom)
	Elle permet d'identifier
		1) Les noeuds qui ne doivent pas être calculés (valeur de 0). Une frange de 0 est placée
		autour de chaque domaine.
		2) Les noeuds internes prennent une valeur >= 1.
		3) Les noeuds condition limite de Dirichlet sont repérés par une valeur de 2.
		
	2) Une matrice reprenant les valeurs des conditions de Dirichlet (appelée cl)
	
	5) Une matrice qui donne un numéro de noeud pour chaque noeud de calcul (appelée num). Cette numérotation permet d'ordonner le système à résoudre. Pour plus d'infos, voir la séance introductive ou avec les étudiants-moniteurs.

	
Informations complémentaires:
-----------------------------

1) Canal rectiligne - pas spatial = 0.5 m

2) Superposition écoulement uniforme et source - pas spatial = 0.001 m

3) Ilot - pas spatial = 0.01 m (attention 2 CL de Dirichlet à tester)
