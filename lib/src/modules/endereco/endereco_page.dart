import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../core/ui/helpers/drop_down_no_icon.dart';
import '../../core/ui/helpers/input.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/primary_button.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../models/endereco_model.dart';
import '../../models/enums/estados_enum.dart';
import 'endereco_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class EnderecoPage extends StatefulWidget {
  const EnderecoPage({super.key});

  @override
  State<EnderecoPage> createState() => _EnderecoPageState();
}

class _EnderecoPageState extends State<EnderecoPage> with Loader, Messages {
  final estadoEC = TextEditingController();
  final cidadeEC = TextEditingController();
  final logradouroEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Modular.get<EnderecoController>();
  List<EnderecoModel> enderecos = [];
  String estadoSelecionado = 'AC';
  bool _sortAscending = true;

  late final ReactionDisposer statusReactionDisposer;

  @override
  void dispose() {
    estadoEC.dispose();
    cidadeEC.dispose();
    logradouroEC.dispose();
    formKey.currentState?.dispose();
    statusReactionDisposer();
    super.dispose();
  }

  void _sort<T>(
    Comparable<T> Function(EnderecoModel d) getField,
    bool ascending,
  ) {
    enderecos.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);
      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    setState(() {
      _sortAscending = ascending;
    });
  }

  @override
  void initState() {
    statusReactionDisposer = reaction(
      (_) => controller.enderecoStatus,
      (status) {
        switch (status) {
          case EnderecoStatus.empty:
            break;
          case EnderecoStatus.loading:
            startLoading();
            break;
          case EnderecoStatus.error:
            stopLoading();
            showError(controller.errorMessage!);
            break;
          case EnderecoStatus.success:
            stopLoading();
            enderecos = controller.enderecos;
            break;
        }
      },
    );
    super.initState();
  }

  void _formSubmit() {
    if (formKey.currentState!.validate()) {
      controller.getEnderecos(
        estadoSelecionado,
        cidadeEC.text,
        logradouroEC.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const Text(
            'Buscar Endereço',
            style: TextStyle(fontSize: 36),
          ),
          const SizedBox(height: 16),
          Form(
            key: formKey,
            child: Column(
              children: [
                if (context.screenWidth > 900)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: DropDownButtonNoIcon(
                          initialValue: null,
                          items: EstadosEnum().dropDowns(),
                          name: 'estado',
                          placeholder: 'Selecione o estado',
                          label: 'Estado',
                          validator:
                              Validatorless.required('Estado é obrigatório'),
                          onChanged: (value) {
                            estadoSelecionado = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Input(
                          label: 'Cidade',
                          text: 'Cidade',
                          controller: cidadeEC,
                          validator:
                              Validatorless.required('Cidade é obrigatório'),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Input(
                          label: 'Logradouro',
                          text: 'Logradouro',
                          controller: logradouroEC,
                          validator: Validatorless.required(
                            'Logradouro é obrigatório',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          PrimaryButton(
                            onPressed: _formSubmit,
                            text: 'Buscar',
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropDownButtonNoIcon(
                        initialValue: null,
                        items: EstadosEnum().dropDowns(),
                        name: 'estado',
                        placeholder: 'Selecione o estado',
                        label: 'Estado',
                        validator:
                            Validatorless.required('Estado é obrigatório'),
                        onChanged: (value) {
                          estadoSelecionado = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Input(
                        label: 'Cidade',
                        text: 'Cidade',
                        controller: cidadeEC,
                        validator:
                            Validatorless.required('Cidade é obrigatório'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Input(
                        label: 'Logradouro',
                        text: 'Logradouro',
                        controller: logradouroEC,
                        validator:
                            Validatorless.required('Logradouro é obrigatório'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryButton(
                        onPressed: _formSubmit,
                        text: 'Buscar',
                      ),
                    ],
                  ),
                const SizedBox(height: 16),
                Observer(
                  builder: (_) {
                    if (controller.enderecoStatus == EnderecoStatus.empty) {
                      return const Center(
                        child: Text('Nenhum endereço selecionado'),
                      );
                    } else {
                      return SizedBox(
                        width: context.screenWidth,
                        child: context.screenWidth > 900
                            ? _tableLarge()
                            : _tableSmall(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  DataTable _tableSmall() {
    return DataTable(
      sortAscending: _sortAscending,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
          label: const Text('CEP'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.cep,
            ascending,
          ),
        ),
        DataColumn(
          label: const Text('Logradouro'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.logradouro,
            ascending,
          ),
        ),
      ],
      rows: enderecos.map(
        (EnderecoModel endereco) {
          return DataRow(
            cells: [
              DataCell(Text(endereco.cep)),
              DataCell(
                Text(
                  '${endereco.logradouro}, ${endereco.bairro}, ${endereco.localidade} - ${endereco.uf}',
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  DataTable _tableLarge() {
    return DataTable(
      sortAscending: _sortAscending,
      sortColumnIndex: 0,
      columns: [
        DataColumn(
          label: const Text('CEP'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.cep,
            ascending,
          ),
        ),
        DataColumn(
          label: const Text('Logradouro'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.logradouro,
            ascending,
          ),
        ),
        // DataColumn(
        //   label: const Text('Complemento'),
        //   onSort: (int columnIndex, bool ascending) => _sort(
        //     (EnderecoModel d) => d.complemento,
        //     ascending,
        //   ),
        // ),
        DataColumn(
          label: const Text('Bairro'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.bairro,
            ascending,
          ),
        ),
        DataColumn(
          label: const Text('Cidade'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.localidade,
            ascending,
          ),
        ),
        DataColumn(
          label: const Text('Estado'),
          onSort: (int columnIndex, bool ascending) => _sort(
            (EnderecoModel d) => d.uf,
            ascending,
          ),
        ),
      ],
      rows: enderecos.map(
        (EnderecoModel endereco) {
          return DataRow(
            cells: [
              DataCell(Text(endereco.cep)),
              DataCell(Text(endereco.logradouro)),
              // DataCell(Text(endereco.complemento)),
              DataCell(Text(endereco.bairro)),
              DataCell(Text(endereco.localidade)),
              DataCell(Text(endereco.uf)),
            ],
          );
        },
      ).toList(),
    );
  }
}
