# Création Groupe de ressources
echo "Création Groupe de ressources Projet_Cloud01"
az group create --name Projet_Cloud01 --location francecentral

# Création Adresse IP publique
echo "Création d'une Adresse IP publique"
az network public-ip create --name public_ip_02 --resource-group Projet_Cloud01 --location francecentral --version IPv4

# Création Réseau virtuel
echo "Création d'un Réseau virtuel"
az network vnet create --name vnet_02 --resource-group Projet_Cloud01

# Création Virtual machine - User : usercloud MDP : ynovtoulouse31!
echo "Création de l'Instance Wordpress 2"
az vm create --name instance_02 --resource-group Projet_Cloud01 --location francecentral --image UbuntuLTS --size Standard_B1ls --authentication-type password --admin-username usercloud --admin-password ynovtoulouse31! --vnet-name vnet_02 --public-ip-address public_ip_02 

# Ouverture des ports
echo "Ouverture des ports 80 et 443 en plus sur l'instance"
az vm open-port --port 80,443 --resource-group Projet_Cloud01 --name instance_02