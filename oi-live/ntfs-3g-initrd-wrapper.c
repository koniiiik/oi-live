#include <unistd.h>
#include <stdio.h>

int main(int argc, char *argv[]) {
	argv[0] = "@ntfs-3g";
	execv("/usr/bin/ntfs-3g", argv);
	perror("ntfs-3g-wrapper");
	return 1;
}

