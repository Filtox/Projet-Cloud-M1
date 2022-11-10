## **Projet Infrastructre Cloud - 03/10/2022**

#### **Membres du projet**
- Pierre Da Silva
- Antoine Zachariades
- Valentin Malo
- Clément Osche

#### Objectif 
La base de données serait atteignable via une passerelle internet.
L’objectif serait d’apporter une solution de scalabilité également.
Terraform pour déployer.

#### **Cloud Provider (Scaleway et Microsoft Azure)**

**Partie 1. Début de l'infrastrure de base sur Scaleway**
*  2 instances
*  1 load balancer
*  1 adresse IP publique
*  1 base de données

---

**Partie 2. Création d'une nouvelle instance sur Microsoft Azure et mise en place d'une gateway entre les 2 Cloud Provider**
* 1 instance
* 1 gateway (entre Azure et Scaleway)

---

**Partie 3. Création d'une base de données sur Microsoft Azure et mise en place de la réplication entre les bases de données des 2 Cloud Provider**
* 1 base de données

Il faudra mettre en place une réplication *en temps réel* entre les 2 bases de données.


---





