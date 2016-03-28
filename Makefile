DESTDIR = /tmp/rf-dyn-ip-$(USER)

all:

install-client:
	@for i in /etc /usr/bin /usr/lib/systemd/system ; \
	do \
		mkdir -p $(DESTDIR)/$$i ; \
	done
	cp client/rf-dyn-ipip         $(DESTDIR)/usr/bin/
	cp client/rf-dyn-ipip.conf    $(DESTDIR)/etc/
	cp client/rf-dyn-ipip.service $(DESTDIR)/usr/lib/systemd/system/

install-server:
	@for i in /etc/httpd/conf.d /var/www/cgi-bin/ /etc/sudoers.d \
	          /usr/share/rf-dyn-ipip /var/lib/rf-dyn-ipip /etc/sysctl.d ; \
	do \
		mkdir -p $(DESTDIR)/$$i ; \
	done
	cp server/httpd.conf      $(DESTDIR)/etc/httpd/conf.d/rf-dyn-ipip.conf
	cp server/rf-dyn-ipip.cgi $(DESTDIR)/var/www/cgi-bin/
	cp server/set-remote      $(DESTDIR)/usr/share/rf-dyn-ipip/
	cp server/start-all       $(DESTDIR)/usr/share/rf-dyn-ipip/
	cp server/sudo.conf       $(DESTDIR)/etc/sudoers.d/rf-dyn-ipip
	cp server/sysctl.conf     $(DESTDIR)/etc/sysctl.d/rf-dyn-ipip.conf
