# Création Groupe de ressources
echo "Création Groupe de ressources Projet_Cloud01"
az group create --name Projet_Cloud01 --location francecentral

# Création Adresse IP publique
echo "Création d'une Adresse IP publique"
az network public-ip create --resource-group Projet_Cloud01 --name myStandardPublicIP --version IPv4 --sku Standard --zone 1