# exercices_kube

# image sur le docker hub 

docker pull patricehub/my_image:latest

# pourquoi on doit utiliser un déploiement au lieu de créer des pods de manière traditionnelle 

Un déploiement permet d'assurer que le nombre souhaité de pods sont bien exécutés et disponibles à tout moment. Le processus de mise à jour est également entièrement enregistré et des versions différentes sont créées pour permettre de le mettre en pause, de le poursuivre ou de revenir aux versions précédentes.
