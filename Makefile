#定义变量
SRCDIR = src
OBJDIR = obj
BINDIR = bin
TARGET = $(BINDIR)/myprogram

SOURCES = $(wildcard $(SRCDIR)/*.cc)
OBJECTS = $(patsubst $(SRCDIR)/%.cc, $(OBJDIR)/%.o, $(SOURCES))

#编译器选项
CC = g++
CFLAGS = -Wall -g -pthread

all: $(TARGET)
#链接
$(TARGET): $(OBJECTS)
	@echo "Linking..."
	@mkdir -p $(BINDIR)
	$(CC) $^ -o $@
#编译
$(OBJDIR)/%.o: $(SRCDIR)/%.cc
	@echo "Compiling $<..."
	@mkdir -p $(OBJDIR)
	$(CC) -c $< -o $@ $(CFLAGS)

#清理目标文件与可执行程序
.PHONY: clean
clean:
	@rm -rf $(OBJDIR)/*.o $(BINDIR)

# 打印变量值（调试用）
.PHONY: show_vars
show_vars:
	@echo "SOURCES: $(SOURCES)"
	@echo "OBJECTS: $(OBJECTS)"
