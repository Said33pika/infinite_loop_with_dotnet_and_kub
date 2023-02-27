# infinite_loop_with_dotnet_and_kub


#1. helm - create tempates and chart and values.yaml

#2. Load image into minikube - minikube image load imagename:tag (should be present locally, if do wnload isrequired, set imagepull policy : ifnotpresent)

#3. Install helm, service, depl and pod get created.

#4. helm upgrade helloworld .\helloworld


#Dotnet test appl
 - Overwrite Program.cs to run an infinite loop, so as to keep container alive (so the pod doesnt crash)
