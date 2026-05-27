# Projet LO12 - Algorithme Apriori et règles CLIPS

## Objectif du projet

Ce projet applique l'algorithme Apriori sur un dataset de paniers d'achat afin de découvrir des associations fréquentes entre produits. Les règles obtenues sont ensuite utilisées pour construire un système de recommandation avec CLIPS.

## Fichiers du projet

- `Appriori.ipynb` : notebook principal avec l'analyse des données, Apriori et les recommandations.
- `clips/apriori_rules_examples.clp` : fichier CLIPS contenant les règles de recommandation et plusieurs paniers de test.
- `requirements.txt` : liste des bibliothèques Python nécessaires.
- `data/groceries - groceries.csv` : dataset utilisé par le notebook.

## Étapes principales

1. Chargement du dataset.
2. Vérification et exploration des données.
3. Transformation des paniers en transactions.
4. Application de l'algorithme Apriori.
5. Génération de règles d'association.
6. Interprétation des règles.
7. Recommandations concrètes pour un vendeur.
8. Test de règles dans CLIPS.

## Exécution du notebook

Installer les dépendances :

```bash
pip install -r requirements.txt
```

Lancer Jupyter Notebook :

```bash
jupyter notebook
```

Puis ouvrir `Appriori.ipynb`.

## Exécution du fichier CLIPS

Dans CLIPS :

```clips
(load "apriori_rules_examples.clp")
(reset)
(run)
(facts)
```

## Intérêt métier

Un vendeur peut utiliser les règles pour :

- placer ensemble des produits souvent achetés ensemble ;
- créer des promotions groupées ;
- recommander automatiquement des produits complémentaires ;
- améliorer l'organisation du magasin.

## Conclusion

Apriori permet de découvrir automatiquement des connaissances à partir des données. CLIPS permet ensuite d'utiliser ces connaissances sous forme de règles compréhensibles et explicables.
