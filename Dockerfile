FROM teiram/quartus:22.1

# Add our compilation scripts
ADD files/ /

CMD ["/bin/bash"]
