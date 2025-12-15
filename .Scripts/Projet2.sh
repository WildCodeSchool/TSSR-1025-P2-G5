#!/bin/bash

#les deux premiers choix "ordinateur" et "utilisateurs" 

while true; do
	echo -e "┌─────────────────────────────┐"
    echo -e "│                             │"
	echo -e "│ sélectionner une cible      │" 
	echo -e "│  1) ordinateur              │"
	echo -e "│  2) utilisateur             │"
	echo -e "│  3) quitter                 │"	
	echo -e "│  choisissez une option :    │"
    echo -e "│                             │"
	echo -e "└─────────────────────────────┘"
	read choix
    


case $choix in 

	1) 
	   #si le choix 1) ordinateur est séléctionné, séléctionner un ordinateur ou quitter  :
	   clear
	   echo -e "┌───────────────────────────────────────┐"
       echo -e "│                                       │"
	   echo -e "│vous avez choisi l'option 'ordinateur' │"
	   echo -e "│ selectionner un ordinateur :          │"
	   echo -e "│ 1) CLILIN01                           │"
	   echo -e "│ 2) quitter                            |"
       echo -e "│                                       │"
       echo -e "│                                       │"
	   echo -e "└───────────────────────────────────────┘"
	   read choix_un 
	   

        case $choix_un in
		   1)
			   #CLILIN01
			   clear
               echo -e "┌───────────────────────────────────────┐"
               echo -e "│                                       │"
               echo -e "│ vous avez choisi CLILIN01             │"
			   echo -e "│ selectionner une option :             │"        
			   echo -e "│ 1) action                             │"			      
			   echo -e "│ 2) informations                       │"
			   echo -e "│ 3) quitter                            │"
               echo -e "│                                       │"
			   echo -e "└───────────────────────────────────────┘"
			   read  choix_action_ou_info
			   

					 case $choix_action_ou_info in 
				   1) 
				      #option action sur ordinateur
                      clear
					  echo -e "┌────────────────────────────────┐"
                      echo -e "│                                │"
				      echo -e "│ selectionner une option:       │"
				      echo -e "│ 1) arret                       │"	
				      echo -e "│ 2) quitter                     │" 
                      echo -e "│                                │"
					  echo -e "└────────────────────────────────┘"	
				      read choix_arret_ou_quitter
				      

						case $choix_arret_ou_quitter in
					    1) 
					         #arret
                             clear
							 echo -e "┌─────────────────────────────────┐"
                             echo -e "│                                 │"
					         echo -e "│	arret de la machine             │"
							 echo -e "│entrez votre mot de passe :      │"
                             echo -e "│                                 │"
							 echo -e "└─────────────────────────────────┘"
							 read -s mdp
					         ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S shutdown -h now"
					         echo -e "arret effectué"
					         ;;
					        
						2) 
						    #quitter
						    exit 0
						    ;;
						
						*) 
								echo -e "option invalide"
							;;
						
						 esac
						 ;;

	                2) 
					 #option informations ordinateur
                       clear
					   echo -e "┌───────────────────────────────┐"
                       echo -e "│                               │"
					   echo -e "│ sélectionner une option       │"
					   echo -e "│ 1) version de l'OS            │"
					   echo -e "│ 2) nombre de partitions       │"
					   echo -e "│ 3) mémoire RAM totale         │"
					   echo -e "│ 4) quitter                    │"
                       echo -e "│                               │"
					   echo -e "└───────────────────────────────┘"
					   read choix_info
					   

					   	  case $choix_info in 
					    1) 
					       #version de l'OS
						    clear
					        echo -e "version de l'OS :"
					        ssh wilder@172.16.50.30 "lsb_release -a" 
					      	 ;;
					    
					    2) 
					       #nombre de partitions 
						   clear
					       echo -e "nombre de partitions :"
					       ssh wilder@172.16.50.30 "lsblk"
					       ;;
					 
						3) 
						   #mémoire RAM totale
						   clear
						   echo -e "RAM totale"
						   ssh wilder@172.16.50.30 "free -h"
						   ;;
					
						4) 
						   #quitter
						   clear
						   exit 0
						   ;;
					   
						*) 
							echo -e "option invalide"
							;;
					
						esac
						;;

                   		      
					3)
					  #quitter 
					    clear
						exit 0
						;;


					*) 
                    	#option invalide 
                        echo -e "option invalide"
                       	;;	

					 esac
					 ;;


            2)
				#quitter 
				clear
				exit 0
				;;
			
			
       		*)
	  			echo -e "option invalide"		
				;;	
        		esac
        		;;

    2) 
	   #si le choix 2) utilisateurs est séléctionné, choisir une action ou creer un compte utilisateur

	   clear
	   echo -e "┌───────────────────────────────────────────────┐"
       echo -e "│                                               │"
	   echo -e "│ vous avez choisi l'option 'utilisateurs'      │"
	   echo -e "│ choisir une option :                          │"
	   echo -e "│ 1) action                                     │"	
	   echo -e "│ 2) créer un compte utilisateur local          │"
	   echo -e "│ 3 informations utilistateur                   │"
	   echo -e "│ 4) quitter                                    │"
       echo -e "│                                               │"
	   echo -e "└───────────────────────────────────────────────┘"
	   read choix_deux
	   

    	case  $choix_deux in 
			
		1)
			
		   #si 'action' est séléctionné :
           clear
		   echo -e "┌───────────────────────────────────┐"
		   echo -e "│  sélectionner un utilisateur      │"
		   echo -e "└───────────────────────────────────┘"	  
		  #lister tous les utilisateurs 
		      USERS=($(ssh wilder@172.16.50.30 "awk -F: '\$3>=1000 {print \$1}' /etc/passwd"))
			      i=1
            for user in "${USERS[@]}"; do
                echo "$i) $user"
                ((i++))
            done

            echo "$i) Quitter"
            read choix_user

            if (( choix_user == i )); then
                break
            else
                USER_SELECTIONNE="${USERS[$choix_user-1]}"
                echo "Tu as choisi : $USER_SELECTIONNE"
            
            
	            #menu d'actions
	            while true; do
                clear
				echo -e "┌──────────────────────────────────────────────┐"
                echo -e "│                                              │"
	            echo -e "│ actions possibles pour $USER_SELECTIONNE     "
	            echo -e "│ 1) changement de mot de passe                │"
	            echo -e "│ 2) ajout à un groupe local                   │"
	            echo -e "│ 3) sortie d'un groupe local                  │"
	            echo -e "│ 4) sortie                                    │"
                echo -e "│                                              │"
				echo -e "└──────────────────────────────────────────────┘"
	            read -p "choisissez une action :" action
		            case "$action" in
		            
		            1) 
		               #changement de mot de passe 
                        clear
					    echo -e "┌────────────────────────────┐"
					    echo -e "│ changement de mot de passe │"
						echo -e "└────────────────────────────┘"
					    echo -e "entrez votre mot de passe sudo :"
						read -s mdp_sudo
						echo
						echo -e "entrez le nouveau mot de passe pour $USER_SELECTIONNE :" 
						read -s mdp_user
						echo
		                ssh -t wilder@172.16.50.30 "echo -e '$mdp_sudo\n$mdp_user\n$mdp_user' | sudo -S passwd '$USER_SELECTIONNE'"
		               ;;
		               
		            2)
			            #ajout à un grope local
                        clear
						echo -e "┌─────────────────────────┐"
						echo -e "│ ajout à un groupe local │"
						echo -e "└─────────────────────────┘" 
			            read -p "nom du groupe à ajouter :" addgroupe
						echo -e "entrez votre mot de passe :"
						read -s mdp
			            ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S usermod -aG $addgroupe $USER_SELECTIONNE"
			            echo "ajout reussi"
			            ;;
			            
			        3)
				        #sortie d'un groupe local
                        clear
						echo -e "┌─────────────────────────┐"
						echo -e "│ sortie d'un groupe local│"
						echo -e "└─────────────────────────┘" 
				        read -p "nom du groupe à ajouter :" delgroupe
						echo -e "entrez votre mot de passe :"
						read -s mdp
				        ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S deluser $USER_SELECTIONNE $delgroupe"
				        echo "suppression reussie"
						;;
				        
		            4) 
		               	#sortie
		           		exit 0
		            	;;
		            
		            *)
			            echo "option invalide"
			            ;;
	            
	            	esac 
				done
			fi
			;;

  		2) 
               #si créer un compte local est séléctionné :
               clear
			   echo -e "┌───────────────────────────────────┐"
               echo -e "│ créer un compte utilisateur local │"
			   echo -e "└───────────────────────────────────┘"
               read -p "nom de l'utilisateur à créer :" username

	               if 
		               ssh wilder@172.16.50.30 "cat /etc/passwd | grep $username"
	               then
		               echo "l'utlisateur existe déja"
	               else
						echo -e "entrez votre mot de passe sudo:"
						read -s mdp
			        	ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S useradd $username"
						echo -e "l'utilisateur à été crée"
                  fi 
                  ;;
                  
                  
        3) 
               #si informations utilisteur est séléctionné
                    clear
			   		echo -e "┌──────────────────────────────────────────────────┐"
                    echo -e "│                                                  │"
                    echo -e "│ informations sur l'utilisateur                   │"
                    echo -e "│ 1) date de dernière connexion de l'utilisateur   │"
                    echo -e "│                                                  │"
				    echo -e "└──────────────────────────────────────────────────┘"
                    read info_user
                    
                    
	                    case "$info_user" in 
	                    1) 
	                       #date de derniere connection
                           clear
						   echo -e "┌───────────────────────────────────────┐"
                           echo -e "│                                       │"
						   echo -e "│ date de dernière connexion            │"
	                       echo -e "│veuillez selectionner un utilisateur   │"
                           echo -e "│                                       │"
						   echo -e "└───────────────────────────────────────┘"
	                       
	                       #lister tous les utilisateurs 
		      USERS=($(ssh wilder@172.16.50.30 "awk -F: '\$3>=1000 {print \$1}' /etc/passwd"))
			      i=1
            	for user in "${USERS[@]}"; do
                echo "$i) $user"
                 ((i++))
           		done

           		 echo "$i) Quitter"
           		 read choix_user

           		 if (( choix_user == i )); then
             	   break
         	  	 else
              		  USER_SELECTIONNE="${USERS[$choix_user-1]}"
               		 echo "Tu as choisi : $USER_SELECTIONNE"

            		ssh wilder@172.16.50.30 "lastlog -u \"$USER_SELECTIONNE\""
				fi
						esac
          		 		 ;; 
	
                  
                  
        4) #si quitter est séléctionné : 
               exit 0
               ;;
               
        *) 
	            echo "option invalide"
	            ;;
	  
					esac
					;;
		     

    3) 
		#quitter
        echo "Au revoir"
        exit 0
            ;;
    *)
        echo "Option invalide"
            ;;
esac

done
