#!/bin/bash

#MENU PRINCIPAL
#les deux premiers choix "ordinateur" et "utilisateurs" 

while true; do
	
	echo -e "┌─────────────────────────────┐"
    echo -e "│                             │"
	echo -e "│ Sélectionner une cible      │" 
	echo -e "│  1- ordinateur              │"
	echo -e "│  2- utilisateur             │"
	echo -e "│  3- quitter                 │"	
	echo -e "│  choisissez une option :    │"
    echo -e "│                             │"
	echo -e "└─────────────────────────────┘"
	read choix
    


case $choix in 

	1) 
	   #si le choix 1) "ordinateur" est séléctionné, séléctionner un ordinateur ou quitter  :
	   clear
	   echo -e "┌───────────────────────────────────────┐"
       echo -e "│                                       │"
	   echo -e "│Vous avez choisi l'option 'ordinateur' │"
	   echo -e "│ Sélectionner un ordinateur :          │"
	   echo -e "│ 1- CLILIN01                           │"
	   echo -e "│ 2- quitter                            |"
       echo -e "│                                       │"
       echo -e "│                                       │"
	   echo -e "└───────────────────────────────────────┘"
	   read choix_un 
	   

        case $choix_un in
		   1)
			   #l'ordinateur CLILIN01 séléctionné
			   clear
               echo -e "┌───────────────────────────────────────┐"
               echo -e "│                                       │"
               echo -e "│ Vous avez choisi CLILIN01             │"
			   echo -e "│ Sélectionner une option :             │"        
			   echo -e "│ 1- action                             │"			      
			   echo -e "│ 2- informations                       │"
			   echo -e "│ 3- quitter                            │"
               echo -e "│                                       │"
			   echo -e "└───────────────────────────────────────┘"
			   read  choix_action_ou_info
			   

					 case $choix_action_ou_info in 
				   1) 
				      #options pour "action" sur "ordinateur"
                      # 1-arret de la machine distante
                      # 2-redémarrage de la machine distante
                      # 3-quitter le script
                      clear
					  echo -e "┌────────────────────────────────┐"
                      echo -e "│                                │"
				      echo -e "│ Sélectionner une option:       │"
				      echo -e "│ 1- arret                       │"
					  echo -e "│ 2- redémarrer                  │"	
				      echo -e "│ 3- quitter                     │" 
                      echo -e "│                                │"
					  echo -e "└────────────────────────────────┘"	
				      read choix_arret_ou_quitter
				      

						case $choix_arret_ou_quitter in
					    1) 
					         #si l'action "arret" est sélectionnée, arrêt immédiat de la machine distante.
                             clear
							 echo -e "┌─────────────────────────────────┐"
                             echo -e "│                                 │"
					         echo -e "│	Arrêt de la machine             │"
							 echo -e "│ Entrez votre mot de passe sudo: │"
                             echo -e "│                                 │"
							 echo -e "└─────────────────────────────────┘"
							 read -s mdp
					         ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S shutdown -h now"
					         echo -e "arret de la machine distante effectué" && exit 0
					         ;;

						2)	
							#si l'action redémarrer est sélectionnée : redémarrage de la machine distante.
							clear
							echo -e "entrez votre mot de passe sudo :"
							read -s mdp
							echo -e "redémarrage de la machine distante en cours" 
							ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S reboot"
							echo -e "redémarrage en cours" && exit 0
							;;


						3) 
						    #si l'option "quitter" est sélectionnée : sortie immédiate du script 
							echo -e "Au revoir !"
						    exit 0
						    ;;
						
						*) 
                            #si une option autre que les trois proposées est inscrite : afficher un message d'erreur "option invalide"
								echo -e "option invalide"
							;;
						
						 esac
						 ;;

	                2) 
					 #Option "informations" sur "ordinateur"
                     # 1- affichage de la version du sytème d'exploitation de la machine distante
                     # 2- affichage du nombre de partitions de la machine distante
                     # 3- affichage de la mémoire RAM totale de la machine distante 
                       
					   echo -e "┌───────────────────────────────┐"
                       echo -e "│                               │"
					   echo -e "│ Sélectionner une option :     │"
					   echo -e "│ 1- version de l'OS            │"
					   echo -e "│ 2- nombre de partitions       │"
					   echo -e "│ 3- mémoire RAM totale         │"
					   echo -e "│ 4- quitter                    │"
                       echo -e "│                               │"
					   echo -e "└───────────────────────────────┘"
					   read choix_info
					   

					   	  case $choix_info in 
					    1) 
					       #Option "version de l'OS" est sélectionnée
						    clear
					        echo -e "version de l'OS :"
					        ssh wilder@172.16.50.30 "lsb_release -a" 
					      	 ;;
					    
					    2) 
					       #Option "nombre de partitions" est sélectionée  
						   clear
					       echo -e "nombre de partitions :"
					       ssh wilder@172.16.50.30 "lsblk"
					       ;;
					 
						3) 
						   #Option "mémoire RAM totale" est sélectionnée 
						   clear
						   echo -e "RAM totale"
						   ssh wilder@172.16.50.30 "free -h"
						   ;;
					
						4) 
						   #Option "quitter" est sélectionnée 
                           #sortie du script
						   clear
						   echo -e "Au revoir !"
						   exit 0
						   ;;
					   
						*) 
                            #Si une autre option autre que les quatre proposées est inscrite : afficher un message d'erreur "option invalide"
							echo -e "option invalide"
							;;
					
						esac
						;;

                   		      
					3)
					  #Option "quitter" est sélectionnée 
                      #sortie du script  
					    clear
						echo -e "Au revoir !"
						exit 0
						;;


					*) 
                    	#si une option autre que les trois proposées est inscrite : afficher un message d'erreur "option invalide"
                        echo -e "option invalide"
                       	;;	

					 esac
					 ;;


            2)
				#l'option quitter séléctionnée
                #sortie du script 
				clear
				echo -e "Au revoir!"
				exit 0
				;;
			
			
       		*) 
                #si une option autre que les deux proposées est inscrite : afficher un message d'erreur "option invalide"
	  			echo -e "option invalide"		
				;;	
        		esac
        		;;

    2) 
	   #si le choix 2- "utilisateurs" est séléctionné, choisir une action, une information ou créer un compte utilisateur

	   clear
	   echo -e "┌───────────────────────────────────────────────┐"
       echo -e "│                                               │"
	   echo -e "│ Vous avez choisi l'option 'utilisateurs'      │"
	   echo -e "│ Choisir une option :                          │"
	   echo -e "│ 1- action                                     │"	
	   echo -e "│ 2- créer un compte utilisateur local          │"
	   echo -e "│ 3- informations utilistateur                  │"
	   echo -e "│ 4- quitter                                    │"
       echo -e "│                                               │"
	   echo -e "└───────────────────────────────────────────────┘"
	   read choix_deux
	   

    	case  $choix_deux in 
			
		1)
			
		   #si l'option "action" est séléctionnée : la liste des utilisateurs de la machine distante apparaît 
           #séléctionner un utilisateur
           clear
		   echo -e "┌───────────────────────────────────┐"
		   echo -e "│  Sélectionner un utilisateur      │"
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
            
            
	            #si l'option "action"et un utilisateur est sélectionné, le menu d'actions s'affiche :
                # 1- changement de mot de passe 
                # 2- ajout à un groupe local
                # 3- sortie d'un groupe local
                # 4- sortie du script
	            while true; do
				echo -e "┌──────────────────────────────────────────────────────┐"
                echo -e "│                                                      │"
				echo -e "│ Actions possibles pour l'utilisateur $USER_SELECTIONNE"
	            echo -e "│ 1- changement de mot de passe                        │"
	            echo -e "│ 2- ajout à un groupe local                           │"
	            echo -e "│ 3- sortie d'un groupe local                          │"
	            echo -e "│ 4- sortie                                            │"
                echo -e "│                                                      │"
				echo -e "└──────────────────────────────────────────────────────┘"
	            read -p "choisissez une action :" action
		            case "$action" in
		            
		            1) 
		               #si l'option "changement de mot de passe" est sélectionnée  
					    echo -e "┌────────────────────────────┐"
					    echo -e "│ Changement de mot de passe │"
						echo -e "└────────────────────────────┘"
					    echo -e "entrez votre mot de passe sudo :"
                        #inscrire en premier temps son mot de passe sudo dans la variable $mdp_sudo
						read -s mdp_sudo
						echo
						echo -e "entrez le nouveau mot de passe pour $USER_SELECTIONNE (doit comporter au moins 8 caractères):" 
						read -s mdp_user
                        #inscrire cette fois le nouveau mot de passe pour l'utilisateur sélectionné, il doit faire au moins 8 caractères.
						echo
		                ssh -t wilder@172.16.50.30 "echo -e '$mdp_sudo\n$mdp_user\n$mdp_user' | sudo -S passwd '$USER_SELECTIONNE'"
						echo -e "Le mot de passe à été modifié avec succès"
		               ;;
		               
		            2)
			            #si l'option "ajout à un grope local" est sélectionnée 
                        clear
						echo -e "┌─────────────────────────┐"
						echo -e "│ Ajout à un groupe local │"
						echo -e "└─────────────────────────┘" 
						echo -e "Ajout de $USER_SELECTIONNE à un groupe"
			            read -p "nom du groupe à ajouter :" addgroupe
                        #inscrire son mot de passe sudo dans la variable $mdp
						echo -e "entrez votre mot de passe sudo:"
						read -s mdp
			            ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S usermod -aG $addgroupe $USER_SELECTIONNE"
			            echo "ajout de $USER_SELECTIONNE au groupe reussi"
			            ;;
			            
			        3)
				        #si l'option "sortie d'un groupe local" est sélectionnée 
                        clear
						echo -e "┌─────────────────────────┐"
						echo -e "│ Sortie d'un groupe local│"
						echo -e "└─────────────────────────┘" 
                        #dans un premier temps, tous les groupes auxquels appartient l'utilisateur s'affiche
						echo -e "GROUPES DE $USER_SELECTIONNE :"
						ssh wilder@172.16.50.30 "groups $USER_SELECTIONNE"
                        #puis inscrire le groupe duquel l'utilisateur doit sortir 
				        read -p "nom du groupe à supprimer :" delgroupe
                        #ensuite inscrire son mot de passe sudo dans la variable $mdp
						echo -e "entrez votre mot de passe sudo:"
						read -s mdp
				        ssh wilder@172.16.50.30 "echo \"$mdp\" | sudo -S deluser $USER_SELECTIONNE $delgroupe"
				        echo "suppression du groupe reussie"
						;;
				        
		            4) 
		               	#l'option quitter séléctionnée
                        #sortie du script 
						echo -e "Au revoir !"
		           		exit 0
		            	;;
		            
		            *) 
                        #si une option autre que les quatre proposées est inscrite : afficher un message d'erreur "option invalide"
			            echo "option invalide"
			            ;;
	            
	            	esac 
				done
			fi
			;;

  		2) 
               #si l'option "créer un compte local" est séléctionné :
               clear
			   echo -e "┌───────────────────────────────────┐"
               echo -e "│ Créer un compte utilisateur local │"
			   echo -e "└───────────────────────────────────┘"
               #inscrire le nom d'utilisateur à creer dans la variable $username
               read -p "nom de l'utilisateur à créer :" username

                    #si l'utilisateur $username existe déja dans le fichier /etc/passwd, alors un message d'érreur s'affiche : "l'utilisateur existe déjà"
                    #sinon, le mot de passe sudo est demandé et l'utilisateur est crée.
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
               #si l'option "informations" sur "utilisteur" est séléctionnée :
                    clear
			   		echo -e "┌──────────────────────────────────────────────────┐"
                    echo -e "│                                                  │"
                    echo -e "│ Informations sur l'utilisateur                   │"
                    echo -e "│ 1- date de dernière connexion de l'utilisateur   │"
                    echo -e "│                                                  │"
				    echo -e "└──────────────────────────────────────────────────┘"
                    read info_user
                    
                    
	                    case "$info_user" in 
	                    1) 
	                       #si l'option "date de derniere connection" est sélectionnée 
                           #séléctionner un utilisateur parmi la liste des utilisateurs affichée 
                           clear
						   echo -e "┌───────────────────────────────────────┐"
                           echo -e "│                                       │"
						   echo -e "│ Date de dernière connexion            │"
	                       echo -e "│ Veuillez selectionner un utilisateur  │"
                           echo -e "│                                       │"
						   echo -e "└───────────────────────────────────────┘"
	                       
	                       #lister tous les utilisateurs de la machine distante
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
                    #affichage de la date de la dernière connection de l'utilisateur sur la machine distante
				fi
						esac
          		 		 ;;
	
                            
                  
        4) 
				#l'option quitter séléctionnée
                #sortie du script 
				echo -e "au revoir !"
                exit 0
                ;;
               
        *) 		
				#si une option autre que les quatre proposées est inscrite : afficher un message d'erreur "option invalide"
	            echo -e "option invalide"
	            ;;
	  
					esac
					;;
		     

    3) 
		#quitter
        echo "Au revoir !"
        exit 0
            ;;
			 
    *)	
		#si une option autre que les trois proposées est inscrite : afficher un message d'erreur "option invalide"
        echo "Option invalide"
            ;;
esac

done
