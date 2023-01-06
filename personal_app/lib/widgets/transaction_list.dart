// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:personal_app/models/transaction.dart';
import 'package:personal_app/services/utils_services.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({
    Key? key,
    required this.transaction,
  }) : super(key: key);
  final List<Transaction> transaction;

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  final UtilsServices utilsServices = UtilsServices();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: widget.transaction.isEmpty
          ? Center(
              child: Column(
                children: [
                  const Text(
                    'Nenhuma transação',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    'assets/imgs/waiting.png',
                    width: 100,
                  ),
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                border: const Border(
                  top: BorderSide(
                    color: Colors.black12,
                  ),
                  left: BorderSide(
                    color: Colors.black12,
                  ),
                  right: BorderSide(
                    color: Colors.black12,
                  ),
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.transaction.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.indigoAccent,
                          child: Text(
                            widget.transaction[index].amount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(
                          widget.transaction[index].title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            fontSize: 20,
                          ),
                        ),
                        subtitle: Text(
                          utilsServices.formatDateTime(
                            widget.transaction[index].date,
                          ),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.restore_from_trash_rounded,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      indent: 10,
                      endIndent: 10,
                    );
                  },
                ),
              ),
            ),
    );
  }
}
