#BUILD
npm run build

#LOCAL
PEM="/Users/parth/Desktop/Secure/admin.pem"
SOURCE="/Users/parth/Documents/Workspace/portfolio-sp/dist/*"

# AWS EC2
EC2="ec2-user@ec2-35-154-236-176.ap-south-1.compute.amazonaws.com"
PROD_DEST="/var/www/html/self.parthjawale/"
DEV_DEST="/var/www/html/dev.parthjawale.com/"
#CLOUDFLARE
ZONE_ID="4154283e1389d687f3c9f3e1efb5c243"
AUTHORIZATION_TOKEN="Bearer kMnD-MeRsFuU7vtQ_3em1jKEJMvV6EeoPnYVlIl7"
API_KEY="0300aa8a90130dc347d2429f830cb701d837a"
EMAIL="parth.jawale24@gmail.com"
EXCLUDE="--exclude deploy.sh --exclude scss --exclude /.gitignore --exclude /.sass-cache"

#DEPLOY TO EC2
rsync -av --progress -e "ssh -i $PEM" $EXCLUDE $SOURCE $EC2:$DEV_DEST

#PURGE CLOUDFLARE
curl -X POST "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/purge_cache" \
     -H "X-Auth-Email: $EMAIL" \
     -H "X-Auth-Key: $API_KEY" \
     -H "Content-Type: application/json" \
     --data '{"purge_everything":true}'

echo