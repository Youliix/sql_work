# Contexte du projet
CRM_data.csv est un fichier csv qui contient de vraies données CRM d'une entreprise.
L'idée de ce sujet est de vérifier si les données sont clean et de produire dans un second temps une analyse des
données présents dans le dataset.

# Contexte:
Il s'agit d'un extrait des leads gagnés et perdus sur une période de 3 mois environ.

# Définitions:

Lead: Un utilisateur qui s'inscrit sur le site de l'entreprise
Taux de conversion: Nombre de Leads gagnés sur nombre de leads inscrits

# Description des données:

Subscribe date: date d'inscription du lead sur notre site
Stagename: Etape actuelle du dossier client dans la base (Ici on ne garde uniquement les dossiers gagnés ou perdus)
Project type: type de projet d'achat: achat d'une résidence principale, d'une résidence secondaire ou bien d'un investissement locatif
Property kind: Type de bien: ancien, nouveau, VEFA, terrain
Source of lead: Canal Marketing source du lead (par exemple pub Google, pub Facebook, partenariat ...)
Amount: Montant du projet (gain si le projet est gagné)
Lost reason: Raison pour laquelle le dossier a été perdu (si perdu)
Lost date: Date de perte du dossier (si perdu)
Won (indicateurs des dossiers gagnés)
Coût du lead: Coût du lead. (si pas de coût, il s'agit d'un lead gratuit: une personne qui vient directement sur le site)

# Questions Préliminaires:

- Décrire les colonnes du dataset
- Donner la proportions de valeurs manquantes pour chaque colonne
- Compter le nombre de valeurs uniques pour chaque colonne
- Donner ces valeurs
- Convertir les 2 colonnes associées à une date au format date de Python
- Créer une nouvelle colonne 'Stagename_bin' qui sera formée de valeurs égales à 0 si Perdu, 1 si gagné 6bis. Créer une 3ème colonne en appliquant la méthode 'get_dummies()'
- Combien y-a-t-il de leads gagnés dans ce dataset ?
- Faire la même chose que les 2 colonnes précédentes pour la colonne Project type
- Renommer les colonnes 'Lost reason' et 'Source of lead' en 'Lost_reason' et 'Source_of_lead'
- Grouper toutes les lignes en fonction 'Source_of_lead'. Lors du groupement, ne conserver que la somme de amount
- Créer une colonne intitulée 'total' qui correspond à la somme de 'Gagné' et 'Perdu'. A quoi est égale cette colonne
- Supprimer la dernière colonne créée vu qu'elle est inutile
- Pour la colonne 'Lost_reason', lorsque c'est le cas, remplacer '/' par '-'
- Remplacer les élément NaN de la colonne 'Property kind' par 'other'

# Questions:

Quel est le montant moyen des inscriptions par mois ?
Calculer l'évolution du taux de conversion par jour. On s'attend à avoir un groupement par mois et par jour et un taux de conversion 2bis. Tracer la courbe du taux de conversion en fonction du temps
Quelles sont les principales raisons de pertes des dossiers (Colonne: "Lost Reason"). A vous de définir comment faire... (Il y a plusieurs façons d'y parvenir)
Le directeur marketing souhaite retravailler la répartition de sonbudget par canal. Quelles recommandations feriez-vous sur les canaux à prioriser
Pensez-vous à des indicateurs ou graphes non réalisés plus hauts qui seraient utiles à réaliser pour mieux comprendre le sujet ? (les réaliser)
Au vu des questions posées dans la rubrique question, aurait-il été intéressant de supprimer les lignes pour lesquelles 'Cout du lead' = np.nan ?
Est-il pertinent de remplacer les éléments NaN de la colonne 'Won' par 0 ? Si oui, le faire sinon laisser tel quel