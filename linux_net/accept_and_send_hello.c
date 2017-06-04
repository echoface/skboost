#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <unistd.h>
#include <arpa/inet.h>
#define MAXBUF 1024
/************关于本文档******************************************** *filename: simple-send.c
*purpose: 演示最基本的网络编程步骤，开启服务接收客户端连接并向客户端发送消息 *wrote by: zhoulifa(zhoulifa@163.com) 周立发(http://zhoulifa.bokee.com) Linux爱好者 Linux知识传播者 SOHO族 开发者 最擅长C语言
*date time:2007-01-24 13:00
*Note: 任何人可以任意复制代码并运用这些文档，当然包括你的商业用途
* 但请遵循GPL
*Hope:希望越来越多的人贡献自己的力量，为科学技术发展出力
* 科技站在巨人的肩膀上进步更快!感谢有开源前辈的贡献! *********************************************************************/
int main(int argc, char **argv) {
	int sockfd, new_fd;
	socklen_t len;
	struct sockaddr_in my_addr, their_addr;
	unsigned int myport, lisnum;
	char buf[MAXBUF + 1];
	if (argv[1])
		myport = atoi(argv[1]);
	else
		myport = 7838;
	if (argv[2])
		lisnum = atoi(argv[2]);

	else
		lisnum = 2;
	if ((sockfd = socket(PF_INET, SOCK_STREAM, 0)) == -1) {
		perror("socket");
		exit(1);
	}
	else printf("socket created\n");
	bzero(&my_addr, sizeof(my_addr));
	my_addr.sin_family = PF_INET;
    printf("\n\x1b[31m==%s %s <<%s>> [%d]====\x1b[0m", __FILE__, __FUNCTION__, "", myport);
	my_addr.sin_port = htons(myport);
	if (argv[3])
        my_addr.sin_addr.s_addr = inet_addr(argv[3]);
	else
        my_addr.sin_addr.s_addr = INADDR_ANY;
	if (bind(sockfd, (struct sockaddr *) &my_addr, sizeof(struct sockaddr)) == -1) {
		perror("bind");
		exit(1);
	}
	else
        printf("binded\n");
	if (listen(sockfd, lisnum) == -1) {
		perror("listen");
		exit(1);
	}
	else printf("begin listen\n");
	while(1) {
		len = sizeof(struct sockaddr);
		if ((new_fd = accept(sockfd, (struct sockaddr *)&their_addr, &len)) == -1) {
			perror("accept");
			exit(errno);
		}
		else printf("server: got connection from %s, port %d, socket %d\n",inet_ntoa(their_addr.sin_addr), ntohs(their_addr.sin_port), new_fd);
		/* 开始处理每个新连接上的数据收发 */
		bzero(buf, MAXBUF + 1);
		strcpy(buf, "hello\n");
		len = send(new_fd, buf, strlen(buf), 0);
		if(len < 0) {
			printf("消息'%s'发送失败!错误代码是%d，错误消息是'%s'\n", buf, errno, strerror(errno));
		} else {
			printf("消息'%s'发送成功，共发送了%d个字节!\n", buf, len);
		}
        close(new_fd);
		/* 处理每个新连接上的数据收发结束 */
	}
	close(sockfd);
	return 0;
}
